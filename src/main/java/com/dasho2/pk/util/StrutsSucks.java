/*
I was working on an Atom (http://www.w3.org/2005/Atom) parser and discovered that I 
could not parse dates in the format defined by RFC 3339 using the  SimpleDateFormat 
class. The  reason was the ':' in the time  zone. This code strips out the colon if 
it's there and tries four different formats on the resulting string depending on if
it has a  time zone, or if it has a  fractional second part.  There is a probably a 
better way  to do this, and a more proper way.  But this is a really small addition 
to a  codebase  (You don't  need a jar, just throw  this  function in  some  static 
Utility class if you have one).

Feel free to use this in your code, but I'd appreciate it if you keep this note  in 
the code if you distribute it.  Thanks!

For  people  who might  be  googling: The date  format  parsed  by  this  goes  by: 
atomDateConstruct,  xsd:dateTime,  RFC3339  and  is compatable with: ISO.8601.1988, 
W3C.NOTE-datetime-19980827  and  W3C.REC-xmlschema-2-20041028   (that  I  know  of)


Copyright 2007, Chad Okere (ceothrow1 at gmail dotcom)
OMG NO WARRENTY EXPRESSED OR IMPLIED!!!1
 */

package com.dasho2.pk.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StrutsSucks {

	public static Date parseRFC3339Date(String datestring)
			throws ParseException, IndexOutOfBoundsException {
		Date d = new Date();

		// if there is no time zone, we don't need to do any special parsing.
		if (datestring.endsWith("Z")) {
			try {
				SimpleDateFormat s = new SimpleDateFormat(
						"yyyy-MM-dd'T'HH:mm:ss'Z'");// spec for RFC3339
				d = s.parse(datestring);
			} catch (java.text.ParseException pe) {// try again with optional
													// decimals
				SimpleDateFormat s = new SimpleDateFormat(
						"yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'");// spec for RFC3339
				// (with fractional
				// seconds)
				s.setLenient(true);
				d = s.parse(datestring);
			}
			return d;
		}

		// step one, split off the timezone.
		int dash = datestring.lastIndexOf('-');
		int plus = datestring.lastIndexOf('+');
		int separator = dash > plus ? dash : plus;
		String firstpart = datestring.substring(0, separator);
		String secondpart = datestring.substring(separator);

		// step two, remove the colon from the timezone offset
		secondpart = secondpart.substring(0, secondpart.indexOf(':'))
				+ secondpart.substring(secondpart.indexOf(':') + 1);
		datestring = firstpart + secondpart;
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ");// spec
																			// for
																			// RFC3339
		try {
			d = s.parse(datestring);
		} catch (java.text.ParseException pe) {// try again with optional
												// decimals
			s = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ");// spec
																		// for
																		// RFC3339
																		// (with
																		// fractional
																		// seconds)
			s.setLenient(true);
			d = s.parse(datestring);
		}
		return d;
	}

	// some testing stuff in main()
	public static void main(String[] args) throws java.text.ParseException {
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26-07:00"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3-07:00"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3452-07:00"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3452Z"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3Z"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26Z"));

		System.out.println(parseRFC3339Date("2007-05-01T15:43:26+03:00"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3+03:00"));
		System.out.println(parseRFC3339Date("2007-05-01T15:43:26.3452+03:00"));
	}
}