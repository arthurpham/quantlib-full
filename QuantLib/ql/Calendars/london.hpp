
/*
 * Copyright (C) 2000-2001 QuantLib Group
 *
 * This file is part of QuantLib.
 * QuantLib is a C++ open source library for financial quantitative
 * analysts and developers --- http://quantlib.org/
 *
 * QuantLib is free software and you are allowed to use, copy, modify, merge,
 * publish, distribute, and/or sell copies of it under the conditions stated
 * in the QuantLib License.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license for more details.
 *
 * You should have received a copy of the license along with this file;
 * if not, please email quantlib-users@lists.sourceforge.net
 * The license is also available at http://quantlib.org/LICENSE.TXT
 *
 * The members of the QuantLib Group are listed in the Authors.txt file, also
 * available at http://quantlib.org/group.html
*/

/*! \file london.hpp
    \brief London calendar

    \fullpath
    ql/Calendars/%london.hpp
*/

// $Id$

#ifndef quantlib_london_calendar_h
#define quantlib_london_calendar_h

#include "ql/Calendars/westerncalendar.hpp"

namespace QuantLib {

    namespace Calendars {

        //! %London calendar
        /*! Holidays:
            <ul>
            <li>Saturdays</li>
            <li>Sundays</li>
            <li>New Year's Day, January 1st (possibly moved to Monday)</li>
            <li>Good Friday</li>
            <li>Easter Monday</li>
            <li>Bank Holiday, first Monday of May</li>
            <li>Bank Holiday, last Monday of May</li>
            <li>Bank Holiday, last Monday of August</li>
            <li>Christmas, December 25th (possibly moved to Monday or
                Tuesday)</li>
            <li>Boxing Day, December 26th (possibly moved to Monday or
                Tuesday)</li>
            </ul>
        */
        class London : public WesternCalendar {
          public:
            London() {}
            std::string name() const { return "London"; }
            bool isBusinessDay(const Date&) const;
          private:
            class LonCalendarFactory : public factory {
              public:
                Handle<Calendar> create() const {
                    return Handle<Calendar>(new London);
                }
            };
          public:
            //! returns a factory of %London calendars
            Handle<factory> getFactory() const {
                return Handle<factory>(new LonCalendarFactory);
            }
        };

    }

}


#endif
