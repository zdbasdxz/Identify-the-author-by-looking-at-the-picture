package Model;

public class Result_Data {
	String NameEN;//英文名
	String NameCN;//中文名
	String Contry;//国家
	String Gender;//性别
	String Works;//作品代表
	String Profession;//职业
	String Date;//出生日期
	String IconUrl;//头像的url
	String DetailsUrl;//百度百科地址
	
	
	public Result_Data(String nameEN, String nameCN, String contry, String gender, String works, String profession,
			String date, String iconUrl, String detailsUrl) {
		super();
		NameEN = nameEN;
		NameCN = nameCN;
		Contry = contry;
		Gender = gender;
		Works = works;
		Profession = profession;
		Date = date;
		IconUrl = iconUrl;
		DetailsUrl = detailsUrl;
	}


	public String getNameEN() {
		return NameEN;
	}


	public void setNameEN(String nameEN) {
		NameEN = nameEN;
	}


	public String getNameCN() {
		return NameCN;
	}


	public void setNameCN(String nameCN) {
		NameCN = nameCN;
	}


	public String getContry() {
		return Contry;
	}


	public void setContry(String contry) {
		Contry = contry;
	}


	public String getGender() {
		return Gender;
	}


	public void setGender(String gender) {
		Gender = gender;
	}


	public String getWorks() {
		return Works;
	}


	public void setWorks(String works) {
		Works = works;
	}


	public String getProfession() {
		return Profession;
	}


	public void setProfession(String profession) {
		Profession = profession;
	}


	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public String getIconUrl() {
		return IconUrl;
	}


	public void setIconUrl(String iconUrl) {
		IconUrl = iconUrl;
	}


	public String getDetailsUrl() {
		return DetailsUrl;
	}


	public void setDetailsUrl(String detailsUrl) {
		DetailsUrl = detailsUrl;
	}


	public Result_Data() {
		super();
	}
	
}
