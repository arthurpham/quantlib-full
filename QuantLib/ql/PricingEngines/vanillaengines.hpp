
/*
 Copyright (C) 2002, 2003 Ferdinando Ametrano
 Copyright (C) 2002, 2003 Sad Rejeb
 Copyright (C) 2000, 2001, 2002, 2003 RiskMap srl

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it under the
 terms of the QuantLib license.  You should have received a copy of the
 license along with this program; if not, please email ferdinando@ametrano.net
 The license is also available online at http://quantlib.org/html/license.html

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
*/

/*! \file vanillaengines.hpp
    \brief Vanilla option engines

    \fullpath
    ql/PricingEngines/%vanillaengines.hpp
*/

// $Id$

#ifndef quantlib_vanilla_engines_h
#define quantlib_vanilla_engines_h

#include <ql/exercise.hpp>
#include <ql/payoff.hpp>
#include <ql/termstructure.hpp>
#include <ql/voltermstructure.hpp>
#include <ql/Math/normaldistribution.hpp>
#include <ql/PricingEngines/genericengine.hpp>

namespace QuantLib {

    namespace PricingEngines {

        //! arguments for vanilla option calculation
        class VanillaOptionArguments : public virtual Arguments {
          public:
            VanillaOptionArguments() : underlying(Null<double>()),
                                       payoff(),
                                       maturity(Null<double>()) {}
            void validate() const;
            double underlying;
            Payoff payoff;
            RelinkableHandle<TermStructure> riskFreeTS, dividendTS;
            RelinkableHandle<BlackVolTermStructure> volTS;
            // we need to calculate option at times that are not
            // generated by real dates. So we need to set t, not a Date
            // that's why we cannot use Exercise below
            Exercise::Type exerciseType;
            std::vector<Time> stoppingTimes;
            Time maturity;
        };

        inline void VanillaOptionArguments::validate() const {
            QL_REQUIRE(payoff.optionType() != Option::Type(-1),
                       "VanillaOptionArguments::validate() : "
                       "no option type given");
            QL_REQUIRE(underlying != Null<double>(),
                       "VanillaOptionArguments::validate() : "
                       "no underlying given");
            QL_REQUIRE(underlying > 0.0,
                       "VanillaOptionArguments::validate() : "
                       "negative or zero underlying given");
            QL_REQUIRE(payoff.strike() != Null<double>(),
                       "VanillaOptionArguments::validate() : "
                       "no strike given");
            QL_REQUIRE(payoff.strike() >= 0.0,
                       "VanillaOptionArguments::validate() : "
                       "negative strike given");
            QL_REQUIRE(!dividendTS.isNull(),
                       "VanillaOptionArguments::validate() : "
                       "no dividend term structure given");
            QL_REQUIRE(!riskFreeTS.isNull(),
                       "VanillaOptionArguments::validate() : "
                       "no risk free term structure given");
            QL_REQUIRE(maturity != Null<double>(),
                       "VanillaOptionArguments::validate() : "
                       "no maturity given");
            QL_REQUIRE(maturity>=0.0,
                       "VanillaOptionArguments::validate() : "
                       "negative maturity");
            QL_REQUIRE(!volTS.isNull(),
                       "VanillaOptionArguments::validate() : "
                       "no vol term structure given");
        }

        //! %results from vanilla option calculation
        class VanillaOptionResults : public OptionValue, 
                                     public OptionGreeks {
          public:
            void reset() {
                OptionValue::reset();
                OptionGreeks::reset();
            }
        };


        //! Vanilla engine base class
        class VanillaEngine : public GenericEngine<VanillaOptionArguments,
                                                   VanillaOptionResults> {};

        //! Pricing engine for European options using analytical formulae
        class AnalyticEuropeanEngine : public VanillaEngine {
          public:
            void calculate() const;
          private:
            #if defined(QL_PATCH_SOLARIS)
            Math::CumulativeNormalDistribution f_;
            #else
            static const Math::CumulativeNormalDistribution f_;
            #endif
        };

        //! Pricing engine for European options using integral approach
        class IntegralEuropeanEngine : public VanillaEngine {
          public:
            void calculate() const;
          private:
        };

        //! Pricing engine for Vanilla options using Finite Differences
        class FDVanillaEngine : public VanillaEngine {
          public:
            void calculate() const;
        };

        
        
        //! Pricing engine for Vanilla options using binomial trees
        class BinomialVanillaEngine : public VanillaEngine {
          public:
            enum Type {CoxRossRubinstein, JarrowRudd, EQP, Trigeorgis, Tian};

            BinomialVanillaEngine(Type type, Size timeSteps)
            : type_(type), timeSteps_(timeSteps) {}
            void calculate() const;
          private:
            Type type_;
            Size timeSteps_;
        };

    }

}

#endif
