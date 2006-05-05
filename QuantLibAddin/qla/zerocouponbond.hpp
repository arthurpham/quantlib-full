
/*
 Copyright (C) 2005 Eric Ehlers
 Copyright (C) 2005 Walter Penschke

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it under the
 terms of the QuantLib license.  You should have received a copy of the
 license along with this program; if not, please email quantlib-dev@lists.sf.net
 The license is also available online at http://quantlib.org/html/license.html

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

#ifndef qla_zerocouponbond_hpp
#define qla_zerocouponbond_hpp

#include <qla/baseinstruments.hpp>

namespace QuantLibAddin {

    class ZeroCouponBond : public Bond {
    public:
        ZeroCouponBond(
            const QuantLib::Date& issueDate,
            const QuantLib::Date& maturityDate,
            const long &settlementDays,
            const QuantLib::DayCounter& dayCounter,
            const QuantLib::Calendar& calendar,
            QuantLib::BusinessDayConvention convention,
            const double &redemption,
            const std::string &handleZeroCurve);
    };
}

#endif

