package HomeWork0413;

import java.util.Scanner;
public class Review2App {

	public static void main(String[] args) {
		// 학생정보를 입력받아서 배열에 저장하기
		
		// 1. 5명의 학생정보를 저장할 수 있는 배열을 정의한다.
		Review2Student[] students = new Review2Student[5];
		
		// 2. 키보드 입력을 읽어오는 Scanner객체를 생성한다.
		Scanner sc = new Scanner(System.in);
		
		// 3. 반복문(for문)을 사용해서 5회 반복한다.
		for(int i=0; i<students.length; i++) {
			
			//		1. 이름, 국어, 영어, 수학점수를 각각 입력받는다.
			System.out.println("이름을 입력하세요.");
			String name = sc.next();
			System.out.println("국어점수를 입력하세요.");
			int kor = (sc.nextInt());
			System.out.println("영어점수를 입력하세요.");
			int eng = (sc.nextInt());
			System.out.println("수학점수를 입력하세요.");
			int math = (sc.nextInt());
			
			//		2. Student객체를 생성해서 입력받은 이름, 국어, 영어, 수학점수를 객체에 저장한다.
			Review2Student tmp = new Review2Student(name, kor, eng, math);
			
			//		3. 배열에 순서대로 저장한다.
			students[i] = tmp;	
		}
		
		// 4. 배열에 저장된 학생들의 정보를 반복문(향상된 for문)을 사용해서 출력한다.
		sc.close();
		for(Review2Student item :students) {
			System.out.println(item.toString());
		}
	}
}
