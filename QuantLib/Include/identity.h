
/* 
Copyright (C) 2000 Ferdinando Ametrano, Luigi Ballabio, Adolfo Benin, Marco Marchioro
See the file LICENSE.TXT for information on usage and distribution
Contact ferdinando@ametrano.net if LICENSE.TXT was not distributed with this file
*/

#ifndef quantlib_identity_h
#define quantlib_identity_h

#include "qldefines.h"

namespace QuantLib {

	namespace PDE {
	
		template <class arrayType>
		class Identity {
		  public:
			arrayType applyTo(const arrayType& a) { return a; }
			arrayType solveFor(const arrayType& a) { return a; }
		};
	
	}

}


#endif
