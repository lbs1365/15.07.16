package service;

public interface MailService {
	public <T> boolean mailSe(T report, String mailAddr);
}
