
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
/*! \file himalaya.hpp
    \brief Himalayan-type option pricer

    \fullpath
    ql/Pricers/%himalaya.hpp
*/

// $Id$

#ifndef quantlib_himalaya_h
#define quantlib_himalaya_h

#include "ql/Pricers/mcmultifactorpricer.hpp"

namespace QuantLib {

    namespace Pricers {

        //! Himalayan-type option pricer
        /*! The payoff of a Himalaya option is computed in the following way:
            Given a basket of N assets, and N time periods, at end of
            each period the option who performed the best is added to the
            average and then discarded from the basket. At the end of the
            N periods the option pays the max between the strike and the
            average of the best performers.
        */
        class Himalaya : public MultiFactorPricer {
        public:
            Himalaya(const Array& underlying,
                     const Array& dividendYield,
                     const Math::Matrix& covariance,
                     Rate riskFreeRate,
                     double strike,
                     const std::vector<Time>& times,
                     unsigned int samples,
                     bool antitheticVariance,
                     long seed = 0);
        };

    }

}


#endif
