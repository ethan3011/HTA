package HTA0416.Review7;

/*EmailMessageSender implements MessageSender*/
public class EmailMessageSender implements MessageSender{

	//sendMessage 재정의
	@Override
	public void sendMessage(String from, String to, String title, String content) {
		System.out.println("### eMail 메시지 발송");
		System.out.println("보내는 사람 : " + from);
		System.out.println("받는 사람 : " + to);
		System.out.println("제목 : " + title);
		System.out.println("내용 : " + content);
		System.out.println();
	}
}
