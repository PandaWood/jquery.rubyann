export interface RubyAnnOptions {
	/**
	 * The closing and opening delimeter characters as a single string eg "[]" or "@@"
	 * Delimiters are used around each word/script in the ruby syntax - the default is "{}"
	 * eg "The word for 'japanese language' is {日,に}{本,ほん}{語,ご}"
	 */
	delimiters: string
}

// noinspection JSUnusedGlobalSymbols
interface JQuery {
	rubyann(options?: RubyAnnOptions): JQuery
}