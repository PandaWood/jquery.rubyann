// Type definitions for jquery.rubyann 1.0.6
// Project: https://github.com/PandaWood/rubyann
// Definitions by: Peter van der Woude <https://github.com/PandaWood>
// Definitions: https://github.com/PandaWood/rubyann
// TypeScript Version: 2.8

/// <reference types="jquery"/>

interface RubyAnnOptions {
	/**
	 * The closing and opening delimiter characters as a single string eg "[]" or "@@" - default is "{}"
	 * These delimiters are used around each word in our custom ruby syntax
	 * eg "The word for 'japanese language' is {日,に}{本,ほん}{語,ご}"
	 */
	delimiters: string;
}

// noinspection JSUnusedGlobalSymbols
interface JQuery {
	rubyann(options?: RubyAnnOptions): JQuery;
}

