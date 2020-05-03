pragma solidity ^0.4.18

contract Exam {
    

    constructor() public {
       // name = "Dapp University Online Exam";
    }     

     // describes a student
    struct Student {
        
        uint id;
        string name;
        uint weight;
        string[] answerIndex;  
    }
    // describes an exam
    struct Exam {
        
       uint id;
        string name;
        bytes32 [] questionsIDs;
        uint numQuestions;
    }
    
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
        string studentAnswer;
        uint totalGrade;
        uint questionsGrades;
        
    }
   // describes a university
    struct University{
        
        uint [] instructorsIDs;
        bytes32 [] examSubmission;
    }
     
     mapping(uint=> question) questions;
     mapping(address => Student) public students;
     mapping(uint => exam) public exams; 
    bytes32[] Exams; // list of exams keys 
     address public owner;
     uint public auctionEnd;
     
     event ExamResult (uint studentID,uint totalGrade);
     
}
     function createExam(uint examID, string name ) public view returns(uint)
     {
    
      owner = msg.sender;
      exams[examID].name = name;
      exams.push(examID);
      auctionEnd = now + (durationMinutes * 1 minutes);
     
      
     return Exams.id ;
    }
    
    uint questionsCount=0;
    
     function addQuestion(uint id,bytes32 questionSentence, string [4] answerOptions,uint mark, string correctAnswerIndex) public {
         
          question.id=id;
          question.questionSentence=questionSentence;
          question.mark=mark;
          question.answerOptions=answerOptions;
          question.correctAnswerIndex=correctAnswerIndex;
          questions[questionsCount] = Question(questionsCount,questionSentence,answerOptions,0,correctAnswerIndex);
          questionsCount++;
    }
    
     function getQuestions()public returns(bytes32 [],string [] ,uint)
     
    {
     
     bytes32[] memory questionSentence= new questionSentence [](questions.length);
     string[] memory  answerOptions= new answerOptions [](questions.length);
     uint mark= new mark;
     string correctAnswerIndex= new correctAnswerIndex;
     
     
       for (uint i = 0; i < questions.length; i++) {
           Question storage question = questions[questions[i]];
            questionSentence[i] = question.questionSentence;
            answerOptions[i] = question.answerOptions;
            mark[i]=question.mark;
           
        }

        return (questionSentence, answerOptions,mark,);
    }
}
    function authorizeStudent( address student){
        
        require(msg.sender == owner);
        require(!students[student].answered);
        
        students[student].weight = 1;
        
    }
    function studentAnswer(string[] answerIndex) view public returns (string , uint) {
    {
      
    require(now < auctionEnd);
    require(!students[msg.sender].answered);
    
    students[msg.sender].answered=true;
    students[msg.sender].answerIndex= answerIndex;
     
           for (uint i = 0; i < questions.length; ++) {
            
            if (questions[i].correctAnswerIndex ==studentAnswer.answerIndex )
            questionMark=questions[i].mark;
            QuestionMark(questions[i].id,questions[i].mark)
               
    
    }
    return (studentAnswer,mark)
}
    // finds the total grade of the Exam
    
        function totalGrade(uint studentID,uint examID) view public returns (uint) {
        
        uint numOfmarks = 0; // we will return this
    
        for (uint i = 0; i < exams[examID].numQuestions; ++) {
            // if the Student answers for this specific question, we increment the mark
            if (ExamSubmission.studentAnswer == question.correctAnswerIndex)
                numOfmarks+=question[i].mark;
            }

        return numOfmarks; 
     }

    function getExamSubmission(uint studentID, uint examID, ) public view returns(uint) {
        
    
        return university.getExamSubmission.totalGrade;
    }
    
    function endExam() {
        
     require(msg.sender == owner);
     require(now >= auctionEnd);
     
     for (uint i = 0; i < questions.length; ++) {
         
        ExamResult=(questions[i].id , questions[i].mark);
     }
        
    }
    
    