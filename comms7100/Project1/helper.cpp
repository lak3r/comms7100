#include <iostream>
#include <fstream>
#include <string>
#include "helper.h"


using namespace std;


void helper::test(string t){	
	cout<<t;
}

//consider looking into malloc for this? Probably not cause I'm using a struct.
dataPoint* helper::readData(ifstream& input){
	string holder;
	dataPoint *head, *current;
	
	for(int i=0; i<4; i++){
		getline(input, holder);
		cout<< holder << "\n";
	}
	
	head = new dataPoint;
	input >> head->unitsX;
	input >> head->unitsY;
	input >> head->valueX >> head->valueY;
	current = head;
	
	cout <<	current->valueX << " " << current->unitsX << "    ";
	cout << current->valueY << " " << current->unitsY << "\n";
	
	
	for(int i=0; input; i++){
		current->next = new dataPoint;
		current->next->previous = current;
		current = current->next;
		input >> current->valueX >> current->valueY;
		current->unitsX = current->previous->unitsX;
		current->unitsY = current->previous->unitsY;
		
		if(i<10 or i%10==0 or i==989){
			cout << "Point " << i+1 << ":  ";
			cout <<	current->valueX << " " << current->unitsX << "    ";
			cout << current->valueY << " " << current->unitsY << "\n";
		}
	}
	
	return(head);
}


void helper::clearData(dataPoint *current){
	
	dataPoint *next = current-> next;
	while(next != NULL){
		delete current;
		current = next;
		next = current ->next;
	}
}

void helper::convertToSIUnits(dataPoint *head){
	//I think I may write a whole new class to do this so that I don't have to do it here...
	//I do think I need to do this before I do anything else.
}
