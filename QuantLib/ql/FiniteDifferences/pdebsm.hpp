/* -*- mode: c++; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

/*
 Copyright (C) 2005 Joseph Wang

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it
 under the terms of the QuantLib license.  You should have received a
 copy of the license along with this program; if not, please email
 <quantlib-dev@lists.sf.net>. The license is also available online at
 <http://quantlib.org/reference/license.html>.

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

/*! \file pdebsm.hpp
    \brief Black-Scholes-Merton PDE
*/

#ifndef quantlib_pdebsm_hpp
#define quantlib_pdebsm_hpp

#include <ql/FiniteDifferences/pde.hpp>
#include <ql/Processes/blackscholesprocess.hpp>

namespace QuantLib {
    class PdeBSM : public PdeSecondOrderParabolic {
    public:
        typedef boost::shared_ptr<BlackScholesProcess> argument_type;
        typedef LogGrid grid_type;
        PdeBSM(const argument_type & process) : process_(process) {};
        virtual Real diffusion(Time t, Real x) const {
            return process_->diffusion(t, x);
        }
        virtual Real drift(Time t, Real x) const {
            return process_->drift(t, x);
        }
        virtual Real discount(Time t, Real x) const {
            if (std::fabs(t) < 1e-8) t = 0;
            return process_->riskFreeRate()->
                forwardRate(t,t,Continuous,NoFrequency,true);
        }
    private:
        const argument_type process_;
    };
}


#endif
