
/*
 * Copyright (C) 2000, 2001
 * Ferdinando Ametrano, Luigi Ballabio, Adolfo Benin, Marco Marchioro
 *
 * This file is part of QuantLib.
 * QuantLib is a C++ open source library for financial quantitative
 * analysts and developers --- http://quantlib.sourceforge.net/
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
 * if not, contact ferdinando@ametrano.net
 *
 * QuantLib license is also available at
 * http://quantlib.sourceforge.net/LICENSE.TXT
*/

/*! \file bsmeuropeanoption.h
    \brief european option

    $Source$
    $Name$
    $Log$
    Revision 1.7  2001/02/20 11:14:37  marmar
    "growth" replaced with dividend

    Revision 1.6  2001/02/13 10:02:17  marmar
    Ambiguous variable name underlyingGrowthRate changed in
    unambiguos dividendYield

    Revision 1.5  2001/01/16 11:23:27  nando
    removed tabs and enforced 80 columns

    Revision 1.4  2000/12/14 12:40:13  lballabio
    Added CVS tags in Doxygen file documentation blocks

*/

#ifndef BSM_european_option_pricer_h
#define BSM_european_option_pricer_h

#include "qldefines.h"
#include "bsmoption.h"
#include "discountfactor.h"

namespace QuantLib {

    namespace Pricers {

        class BSMEuropeanOption : public BSMOption {
          public:
              // constructor
              BSMEuropeanOption(Type type, double underlying, double strike,
                        Rate dividendYield, Rate riskFreeRate,
                        Time residualTime, double volatility)
              : BSMOption(type, underlying, strike, dividendYield,
                            riskFreeRate, residualTime, volatility) {}
              // accessors
              double value() const;
              double delta() const;
              double gamma() const;
              double theta() const;
              double vega() const;
              double rho() const;
            Handle<BSMOption> clone() const {
                return Handle<BSMOption>(new BSMEuropeanOption(*this)); }
          private:
            // declared as mutable to preserve
            // the logical constness (does this word exist?) of value()
            mutable DiscountFactor dividendDiscount_, riskFreeDiscount_;
            mutable double standardDeviation_;
            mutable double alpha_, beta_, NID1_;
        };

    }

}


#endif
