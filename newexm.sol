pragma solidity ^0.4.18;

contract Exam {
    
 
    string public name;

    constructor() public {
        name = "Dapp University Online Exam";
    }
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
        bytes32 [] questionsIDs;
    
    // describes a question
    struct Question {
        uint id;
        bytes32 questionSentence;
        uint mark;
        string [4] answerOptions; // variable to store the list of possible answers
        string correctAnswerIndex;
    }
    // describes an examSubmission
    struct ExamSubmission {
        uint examID;
        uint studentID;
        string studentAnswered;
        uint totalGrade;
        
        uint questionsGrades[];
        
    }
   // describes a university
    struct University{
        uint instructorsIDs[];
        bytes32 examSubmission[];
    }
    
  
   
    mapping (address => Student) Students;
    Question[] public questions;
        
     // Address that identifies the instructors of the exam
    address public instructor;

    // Flag that allows to know if Exam is still available
    bool public isOpen;
    
    // Constructor function, that receives an array with the sentence
    // of each Question, and creates every necessary slot in "questions" array
    // The user that creates the Exam is the instructor
    // thus, the only one able to close it

    function Exam (bytes32[] questionSentences, string [4] answerOptions, uint mark,uint correctAnswerIndex) public {

        instructor = msg.sender;
        isOpen = true;

        for (uint i=0; i < questionSentences.length; ++i){
            // The question is included in the array
            questions.push(question({sentence: questionSentences[i],
            mark: 0 }));

        }
        
        // Exam closing function, can only be called by the instructor, and automatically sets the
        // isOpen flag to false

    function CloseExam () public {
        require((msg.sender == instructor) && isOpen);
        isOpen = false;
    }
    
    uint numQuestions; 
    
     function addQuestion(uint id,bytes32 questionSentence, string [4] answerOptions,uint mark, string correctAnswerIndex) public {
         
         // Create new Question Struct with and saves it to storage.
          questions[questionID] = Question(id,questionSentence,0,answerOptions,correctAnswerIndex);
          question.id=id;
          question.questionSentence=questionSentence;
          question.mark=mark;
          question.answerOptions=answerOptions;
          question.correctAnswerIndex=correctAnswerIndex;
        
    }
    function getExam(uint studentID,uint examID) public view returns (bytes32 questionSentence,string [4] answerOptions)
    
    }
     

    // finds the total grade of the Exam
    
        function totalGrade(uint studentID,uint examID) view public returns (uint) {
        
        uint numOfmarks = 0; // we will return this
        for (uint i = 0; i < numQuestions; ++) {
            // if the Student answers for this specific question, we increment the mark
            if (ExamSubmission.studentAnswered == question.correctAnswerIndex) 
                numOfmarks+=question[i].mark;
            }

        return numOfmarks; 
    

    function getExamSubmission(uint studentID, uint examID, ) public view returns(uint) {
        return university.getExamSubmission.totalGrade;
    }
    
    