#include "JUtils_GetVarType.h"

// ## -----
JUtils_GetVarType::JUtils_GetVarType(){

	_N=1;

	_IPtr=new unsigned int[_N];
	_JPtr=new unsigned int[_N];
	_TPtr=new unsigned int[_N];
	_vPtr=new unsigned int[_N];

	for (int n=0; n<_N; n++){
		*(_IPtr+n)=0.0;
		*(_JPtr+n)=0.0;
		*(_TPtr+n)=0.0;
		*(_vPtr+n)=0.0;
	}

}

// ## -----
JUtils_GetVarType::JUtils_GetVarType(const int &_Nin): _N(_Nin){
	_IPtr=new unsigned int[_N];
	_JPtr=new unsigned int[_N];
	_TPtr=new unsigned int[_N];
	_vPtr=new unsigned int[_N];

	for (int n=0; n<_N; n++){
		*(_IPtr+n)=0.0;
		*(_JPtr+n)=0.0;
		*(_TPtr+n)=0.0;
		*(_vPtr+n)=0.0;
	}
}

//==========================================
JUtils_GetVarType::JUtils_GetVarType(const JUtils_GetVarType &A){

	_N=A._N;

	_IPtr=new unsigned int[_N];
	_JPtr=new unsigned int[_N];
	_TPtr=new unsigned int[_N];
	_vPtr=new unsigned int[_N];

	for (int n=0; n<_N; n++){
		*(_IPtr+n)=*(A._IPtr+n);
		*(_JPtr+n)=*(A._JPtr+n);
		*(_TPtr+n)=*(A._TPtr+n);
		*(_vPtr+n)=*(A._vPtr+n);
	}
}

// ----------
unsigned int JUtils_GetVarType::GetNFromV(const unsigned int &v){

	for (int n=0; n<_N; n++){
		if ((*_vPtr+n)==v)
			return n;
	}

	return 0;
}


// ## -----
JUtils_GetVarType & JUtils_GetVarType::operator= (const JMat & A){
	if (A._N!=_N){
		_N=A._N;

		delete[] _IPtr;
		delete[] _JPtr;
		delete[] _TPtr;
		delete[] _vPtr;
		_IPtr=new unsigned int[_N];
		_JPtr=new unsigned int[_N];
		_TPtr=new unsigned int[_N];
		_vPtr=new unsigned int[_N];
	}

	for (int n=0; n<_N; n++){
		*(_IPtr+n)=*(A._IPtr+n);
		*(_JPtr+n)=*(A._JPtr+n);
		*(_TPtr+n)=*(A._TPtr+n);
		*(_vPtr+n)=*(A._vPtr+n);
	}
	return *this;
}

// ## -----
JUtils_GetVarType::~JUtils_GetVarType(){
	delete[] _IPtr;
		delete[] _JPtr;
			delete[] _TPtr;
			delete[] _vPtr;
}
