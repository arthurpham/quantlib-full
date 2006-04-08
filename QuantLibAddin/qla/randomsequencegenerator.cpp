
/*
 Copyright (C) 2006 Aurelien Chanudet

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

#if defined(HAVE_CONFIG_H)     // Dynamically created by configure
    #include <qla/config.hpp>
#endif
#include <qla/randomsequencegenerator.hpp>

namespace QuantLibAddin {

    std::vector<std::vector<double> > RandomSequenceGenerator::variates(long samples) {
        std::vector<std::vector<double> > rtn;

        for (std::size_t i=0 ; i < samples ; i++) {
            rtn.push_back(nextSequence());
        }

        return rtn;
    }


    MersenneTwisterRsg::MersenneTwisterRsg(long dimension, long seed)
        : PseudoRandomSequenceGenerator<urng_type>(dimension, urng_type(seed)) { }

    // QuantLib::FaureRsg does not work for dimension = 0
    FaureRsg::FaureRsg(long dimension)
        : LowDiscrepancySequenceGenerator<rsg_type>(rsg_type(dimension)) { }

    HaltonRsg::HaltonRsg(long dimension, long seed)
        : LowDiscrepancySequenceGenerator<rsg_type>(rsg_type(dimension, seed)) { }

    SobolRsg::SobolRsg(long dimension, long seed)
        : LowDiscrepancySequenceGenerator<rsg_type>(rsg_type(dimension, seed)) { }

}
