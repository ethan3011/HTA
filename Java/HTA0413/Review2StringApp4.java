package HTA0413;
/*
	카카오에 입사한 신입 개발자 네오는 "카카오계정개발팀"에 배치되어, 카카오 서비스에 가입하는 유저들의 아이디를 생성하는 업무를 담당하게 되었습니다. 
	"네오"에게 주어진 첫 업무는 새로 가입하는 유저들이 카카오 아이디 규칙에 맞지 않는 아이디를 입력했을 때,
	입력된 아이디와 유사하면서 규칙에 맞는 아이디를 추천해주는 프로그램을 개발하는 것입니다.
	다음은 카카오 아이디의 규칙입니다.
	
	아이디의 길이는 3자 이상 15자 이하여야 합니다.
	아이디는 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.) 문자만 사용할 수 있습니다.
	단, 마침표(.)는 처음과 끝에 사용할 수 없으며 또한 연속으로 사용할 수 없습니다.
	"네오"는 다음과 같이 7단계의 순차적인 처리 과정을 통해 신규 유저가 입력한 아이디가 카카오 아이디 규칙에 맞는 지 검사하고 규칙에 맞지 않은 경우 규칙에 맞는 새로운 아이디를 추천해 주려고 합니다.
	신규 유저가 입력한 아이디가 new_id 라고 한다면,

	1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
	2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
	3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
	4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
	5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
	6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
	     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
	7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
 */

public class Review2StringApp4 {

	public static void main(String[] args) {
		String new_id = "=.=";
		
		//1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
		new_id = new_id.toLowerCase();
		System.out.println("1단계 : " +  new_id);
		
		//2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
		new_id = new_id.replaceAll("[^a-z0-9-_.]", "");
		System.out.println("2단계 : " + new_id);
		
		//3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
		new_id = new_id.replaceAll("[.]{2,}",".");
		System.out.println("3단계 : " +  new_id );
		
		//4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
		new_id = new_id.replaceAll("^[.]", "");
		new_id = new_id.replaceAll("[.]$", "");
		System.out.println("4단계 : " + new_id);
		
		//5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
		if(new_id.isEmpty()) {
			new_id = "a";
		}
		System.out.println("5단계 : " + new_id);
		
		//6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
		//     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
		
		if(new_id.length() >= 16) {
			new_id = new_id.substring(0, 15);
			new_id = new_id.replaceAll("[.]$", "");
		}
		System.out.println("6단계 : " + new_id);
		
		//7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
		
		if(new_id.length()<= 2){
			String lastChar = String.valueOf(new_id.charAt(new_id.length()-1)); 
			new_id += lastChar;
			if(new_id.length() == 1) {
				new_id += lastChar;
			}else {
				new_id += lastChar;
			}
		}
		System.out.println("7단계 : " + new_id);
	}
}
