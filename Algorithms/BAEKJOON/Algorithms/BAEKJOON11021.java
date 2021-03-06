package Algorithms;

/*
 * 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 * 
 * 첫째 줄에 테스트 케이스의 개수 T가 주어진다.
 * 각 테스트 케이스는 한 줄로 이루어져 있으며, 각 줄에 A와 B가 주어진다. (0 < A, B < 10)
 * 
 * 각 테스트 케이스마다 "Case #x: "를 출력한 다음, A+B를 출력한다. 테스트 케이스 번호는 1부터 시작한다.
 * 
 * 예제			//			출력
 * 5
 * 1 1			//			Case #1: 2
 * 2 3			//			Case #2: 5
 * 3 4			//			Case #3: 7
 * 9 8			//			Case #4: 17
 * 5 2 			//			Case #5: 7
 * 
 */
import java.io.*;
import java.util.StringTokenizer;
public class BAEKJOON11021 {
	
	public static void main(String[] args) throws IOException{
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int T = Integer.parseInt(br.readLine());
		
		StringTokenizer st;
		StringBuilder sb = new StringBuilder();
		
		for(int i=0; i<T; i++) {
			st = new StringTokenizer(br.readLine(), " ");
			sb.append("Case #"+(i+1)+ ": " + (Integer.parseInt(st.nextToken()) + Integer.parseInt(st.nextToken())) + "\n");
		}
			System.out.println(sb);
	}
}

