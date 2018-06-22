#ifndef JUtils_GetVarType_H
#define JUtils_GetVarType_H

/**
 * Euler angle triplet.
 */
class JUtils_GetVarType
{
public:
	// Constructors and Destructors
	JUtils_GetVarType();
	JUtils_GetVarType(const JUtils_GetVarType &A);
	JUtils_GetVarType(const int &_Nin);
	~JUtils_GetVarType();

  // Operators
	JUtils_GetVarType & operator= (const JUtils_GetVarType & A); //Write to operator

	void FillValue(const unsigned int &n, 
		const unsigned int &v,
		const unsigned int &i, 
		const unsigned int &j, 
		const unsigned int &t);

	unsigned int GetNFromV(const 
		unsigned int &v);
	unsigned int GetIFromN(const 
		unsigned int &n){return *(_IPtr+n);};
	unsigned int GetJFromN(const 
		unsigned int &n){return *(_JPtr+n);};
	unsigned int GetTFromN(const 
		unsigned int &n){return *(_TPtr+n);};


private:
	unsigned int _N;
	unsigned int * _vPtr;
	unsigned int * _IPtr;
	unsigned int * _JPtr;
	unsigned int * _TPtr;

};

#endif //EULERANGLES_H
