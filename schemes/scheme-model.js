const db = require("../data/db-config.js");

module.exports = {
	getSchemes,
	getSchemeByID,
	getSchemeStepsByID,
	addScheme,
	addSchemeSteps,
	updateScheme,
	deleteScheme,
};

function getSchemes() {
	return db("schemes");
} // WORKING

function getSchemeByID(id) {
	// .first() picks the first element of the returned array, returned from the router method
	// all calls to the database return an array
	// even if the arrays are empty or have only one element it will still be an array
	return db("schemes").where({ id }).first();
} // WORKING

function getSchemeStepsByID(id) {
	let scheme_id = id;
	return db("steps").where({ scheme_id });
} // WORKING

function addScheme(scheme) {
	return (
		db("schemes")
			.insert(scheme)
			.returning("id")
			// this is destructuring the ID in place
			.then((ids) => {
				const id = ids[0];

				return getSchemeByID(id);
			})
	);
} // WORKING

function addSchemeSteps(steps) {
	return (
		db("steps")
			.insert(steps)
			.returning("id")
			// this is destructuring the ID in place
			.then((ids) => {
				const id = ids[0];

				return getSchemeStepsByID(id);
			})
	);
} // Not working

function updateScheme(id, changes) {
	return db("schemes")
		.where({ id })
		.update(changes)
		.then(() => {
			return getSchemeByID(id);
		});
} // WORKING

function deleteScheme(id) {
	return db("schemes").where({ id }).del();
} // WORKING
