extern "C" __declspec(dllexport)


void testMethod( int *first, int *second) {
   
   int temp= *first;
   *first=*second;
   *second= temp;     
}