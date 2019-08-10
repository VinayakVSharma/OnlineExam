/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Vinayak Sharma
 */
public class Question_Bank implements Comparable<Question_Bank>{
   private String c_code,q_no,c_name,question,op1,op2,op3,op4,c_ans,unit_no,marks,user_c_ans;

    public String getC_code() {
        return c_code;
    }

    public void setC_code(String c_code) {
        this.c_code = c_code;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getQ_no() {
        return q_no;
    }

    public void setQ_no(String q_no) {
        this.q_no = q_no;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOp1() {
        return op1;
    }

    public void setOp1(String op1) {
        this.op1 = op1;
    }

    public String getOp2() {
        return op2;
    }

    public void setOp2(String op2) {
        this.op2 = op2;
    }

    public String getOp3() {
        return op3;
    }

    public void setOp3(String op3) {
        this.op3 = op3;
    }

    public String getOp4() {
        return op4;
    }

    public void setOp4(String op4) {
        this.op4 = op4;
    }

    public String getC_ans() {
        return c_ans;
    }

    public void setC_ans(String c_ans) {
        this.c_ans = c_ans;
    }

    public String getUnit_no() {
        return unit_no;
    }

    public void setUnit_no(String unit_no) {
        this.unit_no = unit_no;
    }

    public String getMarks() {
        return marks;
    }

    public void setMarks(String marks) {
        this.marks = marks;
    }

    public String getUser_c_ans() {
        return user_c_ans;
    }

    public void setUser_c_ans(String user_c_ans) {
        this.user_c_ans = user_c_ans;
    }

    public int compareTo(Question_Bank q) {
        int res=Integer.parseInt(this.getQ_no())-Integer.parseInt(q.getQ_no());
        return res;
    }  
    
}
