package kh.web.dto;

public class InfluencerDTO {


   private int seq;
   private String id;
   private String pw;
   private String photo;
   private String name;
   private String nickname;
   private String zipcode;
   private String address1;
   private String address2;
   private String sns;
   private String phone;
   private String email;
   private String grade;
   private String pwAsk;
   private String pwAnswer;
   private String favorite;
   
   public InfluencerDTO() {}
      
   public InfluencerDTO(int seq, String id, String pw, String photo, String name, String nickname, String zipcode,
         String address1, String address2, String sns, String phone, String email, String grade, String pwAsk,
         String pwAnswer, String favorite) {
      super();
      this.seq = seq;
      this.id = id;
      this.pw = pw;
      this.photo = photo;
      this.name = name;
      this.nickname = nickname;
      this.zipcode = zipcode;
      this.address1 = address1;
      this.address2 = address2;
      this.sns = sns;
      this.phone = phone;
      this.email = email;
      this.grade = grade;
      this.pwAsk = pwAsk;
      this.pwAnswer = pwAnswer;
      this.favorite = favorite;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPw() {
      return pw;
   }

   public void setPw(String pw) {
      this.pw = pw;
   }

   public String getPhoto() {
      return photo;
   }

   public void setPhoto(String photo) {
      this.photo = photo;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getZipcode() {
      return zipcode;
   }

   public void setZipcode(String zipcode) {
      this.zipcode = zipcode;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }

   public String getSns() {
      return sns;
   }

   public void setSns(String sns) {
      this.sns = sns;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getGrade() {
      return grade;
   }


}