pragma solidity ^0.4.18;

contract Exam {
    
    
    string public name;

    constructor() public {
        
        name = "Dapp University Online Exam";
        
}
    // describes a student
    struct Student {
        uint id;
        string name;
    }
    // describes an exam
    struct Exam {
        uint id;
        string name;
        bytes32 questionsIDs[];
    
    // describes a question
    struct Question {
        uint id;
        string questionSentence;
        uint mark;
        string [4] answers; // variable to store the list of possible answers
        string correctAnswerIndex;
        
    }
    // describes an examSubmission
    struct ExamSubmission {
        uint examID;
        uint studentID;
        uint totalGrade;
        uint questionsGrades[];
        
    }
   // describes a university
    struct University{
        uint instructorsIDs[];
        bytes32 examSubmission[];
    }
    
    // Read/write questionss
    mapping(uint => question) public questions;

    }


    uint numQuestions; 
    
     function addQuestion(uint id,string questionSentence, uint mark,string [4] answers, string correctAnswerIndex  ) public {
        // QuestionID is the return variable
        uint questionID = numQuestions++;
        // Create new Question Struct with and saves it to storage.
        questions[questionID] = Question(id,questionSentence,0,answers,correctAnswerIndex);
        AddedQuestion(questionID);
    }

        
    // finds the total amount of marks
    
    function totalGrade(uint examID) view public returns (uint) {
        
        uint numOfmarks = 0; // we will return this
        for (uint i = 0; i < numQuestions; ++) {
            // if the Student answers for this specific question, we increment the mark
            if (exams[examID].numQuestions == correctAnswerIndex) {
                numOfmarks++2;
            }
        }
        return numOfmarks; 
    

    function getExamSubmission(uint studentID, uint examID, ) public view returns(uint) {
        return university.getExamSubmission.totalGrade;
    },



    