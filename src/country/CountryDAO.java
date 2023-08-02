package country;

import java.util.List;

public interface CountryDAO {
	int countAll();
	List<Country> getByPage(int page, int pagePer);
	List<Country> getAll();
	List<Country> getByContinent(String continent);
}