
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

/*! \file daycounter.hpp
    \brief Abstract day counter class

    \fullpath
    ql/%daycounter.hpp
*/

// $Id$

#ifndef quantlib_day_counter_h
#define quantlib_day_counter_h

#include "ql/date.hpp"
#include "ql/handle.hpp"
#include "ql/null.hpp"

/*! \namespace QuantLib::DayCounters
    \brief Concrete implementations of the DayCounter interface

    See sect. \ref dayconters
*/

namespace QuantLib {

    //! Abstract day counter class
    /*! This class is purely abstract and defines the interface of concrete
        day counter classes which will be derived from this one.

        It provides methods for determining the length of a time period
        according to a number of market conventions, both as a number of days
        and as a year fraction.
    */
    class DayCounter {
      public:
        //! \name DayCounter interface
        //@{
        //! Returns the name of the day counter.
        /*! \warning This method is used for output and comparison between day
            counters.
            It is <b>not</b> meant to be used for writing switch-on-type code.
        */
        virtual std::string name() const = 0;
        //! Returns the number of days between two dates.
        virtual int dayCount(const Date&, const Date&) const = 0;
        //! Returns the period between two dates as a fraction of year.
        virtual Time yearFraction(const Date&, const Date&,
          const Date& refPeriodStart = Date(),
          const Date& refPeriodEnd = Date()) const = 0;
        //@}
        //! abstract base class for calendar factories
        class DayCounterFactory {
          public:
            virtual Handle<DayCounter> create() const = 0;
        };
        typedef DayCounterFactory factory;
    };

    // comparison based on name
    bool operator==(const Handle<DayCounter>&, 
        const Handle<DayCounter>&);
    bool operator!=(const Handle<DayCounter>&, 
        const Handle<DayCounter>&);

    // inline definitions

    /*! Returns <tt>true</tt> iff the two day counters belong to the same
        derived class.
        \relates DayCounter
    */
    inline bool operator==(const Handle<DayCounter>& h1,
        const Handle<DayCounter>& h2) {
            return (h1->name() == h2->name());
    }

    /*! \relates DayCounter */
    inline bool operator!=(const Handle<DayCounter>& h1,
        const Handle<DayCounter>& h2) {
            return (h1->name() != h2->name());
    }

}


#endif
