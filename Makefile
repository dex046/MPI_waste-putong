MPI_waste: H_Border.o h_Coord.o Inside.o Partition.o RWsgy.o DataTran.o testTDFWI.o testmain.o
	mpicxx -o MPI_waste H_Border.o h_Coord.o Inside.o Partition.o  RWsgy.o DataTran.o testTDFWI.o testmain.o

H_Border.o: Partition.h H_Border.cpp
	mpicxx -c -std=c++11 H_Border.cpp

h_Coord.o: Partition.h h_Coord.cpp
	mpicxx -c -std=c++11 h_Coord.cpp

Inside.o: Partition.h Inside.cpp
	mpicxx -c -std=c++11 Inside.cpp

Partition.o: Partition.cpp Partition.h H_Border.cpp h_Coord.cpp Inside.cpp
	mpicxx -c -std=c++11 Partition.cpp

RWsgy.o: RWsgy.cpp RWsgy.h Partition.h
	mpicxx -c -std=c++11 RWsgy.cpp

DataTran.o: DataTran.cpp DataTran.h Partition.h 
	mpicxx -c -std=c++11 DataTran.cpp

testTDFWI.o: testTDFWI.cpp testTDFWI.h Partition.h
	mpicxx -c -std=c++11 testTDFWI.cpp

testmain.o: testmain.cpp 
	mpicxx -c -std=c++11 testmain.cpp

clean:
	rm -rf *.o
	rm -rf MPI_waste
