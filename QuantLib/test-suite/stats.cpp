
/*
 Copyright (C) 2003 Ferdinando Ametrano
 Copyright (C) 2003 RiskMap srl

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

#include "stats.hpp"
#include "utilities.hpp"
#include <ql/Math/statistics.hpp>
#include <ql/Math/incrementalstatistics.hpp>
#include <ql/Math/gaussianstatistics.hpp>
#include <ql/Math/sequencestatistics.hpp>
#include <ql/Utilities/dataformatters.hpp>

using namespace QuantLib;
using namespace boost::unit_test_framework;

namespace {

    typedef GaussianStatistics<IncrementalStatistics>
        IncrementalGaussianStatistics;

    Real data[] =    { 3.0, 4.0, 5.0, 2.0, 3.0, 4.0, 5.0, 6.0, 4.0, 7.0 };
    Real weights[] = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };


    template <class S>
    void check(const std::string& name) {

        S s;
        for (Size i=0; i<LENGTH(data); i++)
            s.add(data[i],weights[i]);

        Real calculated, expected;
        Real tolerance;

        if (s.samples() != LENGTH(data))
            BOOST_FAIL(name << ": wrong number of samples\n"
                       << "    calculated: " << s.samples() << "\n"
                       << "    expected:   " << LENGTH(data));

        expected = std::accumulate(weights,weights+LENGTH(weights),0.0);
        calculated = s.weightSum();
        if (calculated != expected)
            BOOST_FAIL(name << ": wrong sum of weights\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = *std::min_element(data,data+LENGTH(data));
        calculated = s.min();
        if (calculated != expected)
            BOOST_FAIL(name << ": wrong minimum value\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = *std::max_element(data,data+LENGTH(data));
        calculated = s.max();
        if (calculated != expected)
            BOOST_FAIL(name << ": wrong maximum value\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = 4.3;
        tolerance = 1.0e-9;
        calculated = s.mean();
        if (std::fabs(calculated-expected) > tolerance)
            BOOST_FAIL(name << ": wrong mean value\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = 2.23333333333;
        calculated = s.variance();
        if (std::fabs(calculated-expected) > tolerance)
            BOOST_FAIL(name << ": wrong variance\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = 1.4944341181;
        calculated = s.standardDeviation();
        if (std::fabs(calculated-expected) > tolerance)
            BOOST_FAIL(name << ": wrong standard deviation\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = 0.359543071407;
        calculated = s.skewness();
        if (std::fabs(calculated-expected) > tolerance)
            BOOST_FAIL(name << ": wrong skewness\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);

        expected = -0.151799637209;
        calculated = s.kurtosis();
        if (std::fabs(calculated-expected) > tolerance)
            BOOST_FAIL(name << ": wrong kurtosis\n"
                       << "    calculated: " << calculated << "\n"
                       << "    expected:   " << expected);
    }

}


void StatisticsTest::testStatistics() {

    BOOST_MESSAGE("Testing statistics...");

    check<IncrementalGaussianStatistics>(
        std::string("IncrementalGaussianStatistics"));
    check<Statistics>(std::string("Statistics"));
}


namespace {

    template <class S>
    void checkSequence(const std::string& name,
                       Size dimension) {

        SequenceStatistics<S> ss(dimension);
        Size i;
        for (i = 0; i<LENGTH(data); i++) {
            std::vector<Real> temp(dimension, data[i]);
            ss.add(temp, weights[i]);
        }

        std::vector<Real> calculated;
        Real expected, tolerance;

        if (ss.samples() != LENGTH(data))
            BOOST_FAIL("SequenceStatistics<" << name << ">: "
                       << "wrong number of samples\n"
                       << "    calculated: " << ss.samples() << "\n"
                       << "    expected:   " << LENGTH(data));

        expected = std::accumulate(weights,weights+LENGTH(weights),0.0);
        if (ss.weightSum() != expected)
            BOOST_FAIL("SequenceStatistics<" << name << ">: "
                       << "wrong sum of weights\n"
                       << "    calculated: " << ss.weightSum() << "\n"
                       << "    expected:   " << expected);

        expected = *std::min_element(data,data+LENGTH(data));
        calculated = ss.min();
        for (i=0; i<dimension; i++) {
            if (calculated[i] != expected)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong minimum value\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = *std::max_element(data,data+LENGTH(data));
        calculated = ss.max();
        for (i=0; i<dimension; i++) {
            if (calculated[i] != expected)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong maximun value\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = 4.3;
        tolerance = 1.0e-9;
        calculated = ss.mean();
        for (i=0; i<dimension; i++) {
            if (std::fabs(calculated[i]-expected) > tolerance)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong mean value\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = 2.23333333333;
        calculated = ss.variance();
        for (i=0; i<dimension; i++) {
            if (std::fabs(calculated[i]-expected) > tolerance)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong variance\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = 1.4944341181;
        calculated = ss.standardDeviation();
        for (i=0; i<dimension; i++) {
            if (std::fabs(calculated[i]-expected) > tolerance)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong standard deviation\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = 0.359543071407;
        calculated = ss.skewness();
        for (i=0; i<dimension; i++) {
            if (std::fabs(calculated[i]-expected) > tolerance)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong skewness\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }

        expected = -0.151799637209;
        calculated = ss.kurtosis();
        for (i=0; i<dimension; i++) {
            if (std::fabs(calculated[i]-expected) > tolerance)
                BOOST_FAIL("SequenceStatistics<" << name << ">: "
                           << io::ordinal(i+1) << " dimension: "
                           << "wrong kurtosis\n"
                           << "    calculated: " << calculated[i] << "\n"
                           << "    expected:   " << expected);
        }
    }

}

void StatisticsTest::testSequenceStatistics() {

    BOOST_MESSAGE("Testing sequence statistics...");

    checkSequence<IncrementalGaussianStatistics>(
        std::string("IncrementalGaussianStatistics"),5);
    checkSequence<Statistics>(std::string("Statistics"),5);
}


test_suite* StatisticsTest::suite() {
    test_suite* suite = BOOST_TEST_SUITE("Statistics tests");
    suite->add(BOOST_TEST_CASE(&StatisticsTest::testStatistics));
    suite->add(BOOST_TEST_CASE(&StatisticsTest::testSequenceStatistics));
    return suite;
}

