# Spring MVC 

### 게임정보 조회하기
<ul>
    <li>전체 게임 조회하기</li>
    <li>요청방식 : GET</li>
    <li>요청URL : localhost/HTA0721/game/list</li>
    <li>요청핸들러 메소드</li>
</ul>

```
@GetMapping(“/list”)
public String getAllGames(Model model) {
    // 전체 게임정보 조회하기
    List<Game> games = gameService.getAllGames();

    // 뷰에 조회된 정보 전달하기
    model.addAttribute(“games”, games);

    // 뷰 페이지 이름 반환
    (/WEB-INF/views/ = prefix) + game/list + “(.jsp = suffix)”
    return “game/list”;
}
```

### 데이터베이스 엑세스 작업 정의
* GameDao   
```List<Game> getAllGames();```
* games.xml   
```<select id=”getAllGames” resultType=”com.sample.vo.Game”></select>```

### 클라이언트의 요청을 처리하기 위한 업무로직 구현
* GameService   
```List<Game> getAllGames();```
* GameServiceImpl   
```
public List<Game> getAllGames() {
    return gameDao.getAlGames();
}
```


### 게임 상세정보 조회하기
<ul>
    <li>요청방식 : GET</li>
    <li>요청URL : localhost/HTA0721/game/detail?no=100</li>
    <li>요청핸들러 메소드</li>
</ul>

```
@GetMapping(“/detail”)
public String detail(@RequestParam(“no) int gameNo, Model model) {
    // 게임정보에 해당하는 게임만 조회
    Game game = gameService.getGameByNo(gameNo)

    // 뷰에 조회된 정보 전달하기
    model.addAttribute(“game”, game);

    return : “/WEB-INF/views/ + game/detail + “.jsp”
}
```

### GameDao   
```Game getGameByNo(int gameNo)```
### games.xml   
```<select id=”getGameByNo” parameterType=”int” resultType=”com.sample.vo.Game></select>```

### gamesService
```Game getGameByNo(int gameNo)```
### gameServiceImpl
```
public Game getGameByNo(int gameNo) {
    // 게임정보에 해당하는 상품정보를 조회해서 반환한다.
}
```

### 사용자 인증하기(로그인하기)  

<ul>
    <li>요청방식 : GET</li>
    <li>요청URL : localhost/HTA0721/login</li>
    <li>컨트롤러 : HomeController</li>
    <li>요청핸들러 메소드</li>
</ul>

```
@GetMapping(“/login”)
public String loginform() {
    // “WEB-INF/views/” + loginform + “.jsp”
    return “loginform”;
}
```

### 사용자 인증하기(로그인하기)   
<ul>
    <li>요청방식 : POST</li>
    <li>요청URL : localhost/HTA0721/login</li>
    <li>폼데이터 : id=hong&passsword=”zxcv1234”</li>
</ul>

### 요청핸들러 메소드   
```
@PostMapping("/login")
public String login(@RequestParam("id") String id, @RequestParam("password") String password) {
}
```

```
@PostMapping("/login")
public String login(String id, String password) {
}
```

```
@PostMapping(“/login”)
public String login(User user {
}
```

# 데이터베이스 엑세스
### UserDao 인터페이스   
```User getUserById(String userId)```

### users.xml   
```<select id=”getUserById” …></select>```

# 업무로직 구현   
### UserSerivce 인터페이스   
```
void login(String userId, String password)
```

### UserServiceImpl 구현클래스   
```
void login(String userid, String password) {
	// 사용자 인증처리하기
}
```



# 장바구니   
### 장바구니에 상품담기   
<ul>
    <li>요청방식 : GET</li>
    <li>요청URL : localhost/HTA)721/game/addCart?no=100</li>
    <li>컨트롤러 : GameController</li>
    <li>요청핸들러 메소드</li>
</ul>
```
@GetMapping(“/addCart”)
			public String addCartItem(@RequestParam(“no) int gameNo) {
}
```

# 데이터베이스 액세스   
### CartDao   
```
    void insertCartItem(CartItem cartItem)
    CartItem getCartItem(String userId, int gameNo)
    void updateCartItem(CartItem cartItem)
```

# 업무로직   
### GameService   
```void addCartItem(CartItem cartItem)```
### GameServiceImpl   
```
public void addCartItem(CartItem cartItem) {
    // 업무로직 수행
    // 장바구니에 동일한 상품이 이미 저장되어 있는 경우 -> 갯수증가
}
```

# 새롭게 알게된 사실
1. Session 사용법
    + com.sample.web.utils 패키지 생성
    + SessionUtils.java 클래스 생성
    + ServeltRequestAttributes 와 RequestContextHolder.currentRequestAttributes()를 사용해서 지금 서버로 제출한 세션객체를 얻을 수 있다.
    + 획득한 세션객체로 속성값 추가/반환/삭제, 세션객체 폐기도 가능하다.
```
private static HttpSession getSession(boolean create) {
    ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
    return attributes.getRequest().getSession();
}
/**
* HttpSession에 속성을 추가한다.
* @param name 속성명
* @param value 속성값 혹은 객체
*/
public static void addAttributes(String name, Object value) {
    getSession(true).setAttribute(name, value);
}

/**
* HttpSession에 있는 지정된 속성을 반환한다.
* @param name 속성명
* @return
*/
public static Object getAttributes(String name) {
    return getSession(true).getAttribute(name);
}

/**
* HttpSession에 있는 지정된 속성명을 삭제한다.
* @param name 속성명
*/
public static void removeAttributes(String name) {
    getSession(true).removeAttribute(name);
}

/**
* HttpSession객체를 폐기한다.
*/
public static void destorySession() {
    HttpSession session = getSession(false);
    if (session != null) {
      session.invalidate();
    }
}
```

2. BeanUtils
    + BeanUtils.copyProperties를 사용해서 매개변수로 받은 객체를 똑같이 User에 복사할 수 있다.
    + UserRegisterForm은 com.sample.web.form 에서 POST form값을 저장하는 java class객체다.
```
@PostMapping("/register")
public String registerUser(UserRegisterForm userRegisterForm) {

    User user = new User();
    BeanUtils.copyProperties(userRegisterForm, user);

    userService.registerUser(user);

    return "redirect:main";
}
```
3. SessionUtils
    + com.sample.web.utils에 생성한 SessionUtils.addAttributes를 사용하여 로그인 처리를 할 수 있다.
    + SessionUtils.addAttributes("LOGINED_USER", user) 형식으로(String, Object) 사용한다.
    + 한번 생성만 해두면 여러곳에서 사용할 수 있는 장점이 있다.
    + header객체에서도 사용할 수 있다.(JSP는 불가능)
```
@Override
public void login(String id, String password) {

    User user = userDao.getUserById(id);

    if(user == null) {
    throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
    }
    
    if(user.getStatus().equals("inactive")) {
    throw new RuntimeException("탈퇴되거나 이용 제한된 회원입니다.");
    }
    
    String encodedPassword = DigestUtils.sha256Hex(password);
    if(!user.getPassword().equals(encodedPassword)) {
    throw new RuntimeException("아이디 혹은 비밀번호가 일치하지 않습니다.");
    }
    
    // com.sample.web.utils 에 있는 SessionUtils 클래스에 정의된 addAtrribute를 사용한다.
    SessionUtils.addAttributes("LOGINED_USER", user);
}
```
4. @RequestParam(value)
    + value 자리에 jsp로부터 받아온 /detail?no=100 no=뒤의 값을 읽어올 수 있다.
    + 사용법은 ("") "" 사이에 넘어온 값을 적어준다.
```
@GetMapping("/detail")
    public String detail(@RequestParam("no") int no, Model model) {
    Game game = gameService.getGameByNo(no);

    model.addAttribute("Game", game);

    return "game/detail";
}
```
5. @Param 으로 두개의 value xml에서 읽어오기
    + DAO에서 (@Param("parameterValue") type name, @Param("parameterValue") type name)
    + 위 두개를 매개변수로 넣어서 xml파일에서는 #{parameterValue} 값을 넣어서 읽을 수 있다.
    + 매개변수에 들어간 값과 xml에 #{} 값은 무조건적으로 이름이 같아야 한다.
    + xml파일에서 parameterType을 적지 않는다.(이미 dao에서 적었기 때문)
```
########## cartItemDao ##########
/**
    * 유저아이디와 상품(게임)번호가 일치하는 카트객체를 반환한다.
    * @param userId 유저아이디
    * @param productNo 상품번호
    * @return 일치하는 상품객체, 없을경우 null이 반한된다.
    */
    CartItem getCartItem(@Param("userId") String userId, @Param("productNo")int productNo);

########## cartItems.xml ##########
<select id="getCartItem" resultType="com.sample.vo.CartItem">
    select
        item_no no,
        user_id id,
        product_no productNo,
        item_amount amount,
        item_created_date	createdDate
    from
        sample_cart_items
    where
        user_id = #{userId}
    and
        product_no = #{productNo}
    </select>
```
