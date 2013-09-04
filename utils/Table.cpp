#include "Table.hh"
#include <iostream>
#include <iomanip>

using namespace std;

static void drawline(int width, int n){
	for(int i=0; i <= n; i++)
		for(int j=0; j < width; j++)
			cout<<"-";
	cout<<endl;
}

static void drawblankline(int width, int n){
	for(int i=0; i <= n; i++){
		cout<<"|";
		for(int j=1; j < width; j++)
			cout<<" ";
	}
	cout<<"|";
	cout<<endl;
}

static void drawtoprow(int width, const char* cols, int n){
	cout<<"|";
	for(int j=1; j < width; j++)
		cout<<" ";
	for(int i=0; i < n; i++){
		cout<<"|"<<setw(width-1)<<cols[i];
	}
	cout<<"|";
	cout<<endl;
}

static void drawrow(int width, 
		    const char *row, double *data, int n){
	cout<<"|";
	cout<<setw(width-1)<<row;
	for(int i=0; i < n; i++){
		cout<<"|"<<setw(width-1)<<data[i];
	}
	cout<<"|"<<endl;
} 


void Table::print(){
	drawline(width, n);
	drawblankline(width, n);
	drawtoprow(width, cols, n);
	drawblankline(width, n);
	drawline(width, n);
	double rdata = new double[n];
	for(int i=0; i < m; i++){
		drawblankline(width, n);
		for(int j=0; j < n; j++)
			rdata[j] = data[i+j*m];
		drawrow(width, rows[i], rdata, n);
		drawblankline(width, n);
		drawline(width, n);
	}
	delete[] rdata;
}
