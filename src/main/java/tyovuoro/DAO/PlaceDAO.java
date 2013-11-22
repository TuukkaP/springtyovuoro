package tyovuoro.DAO;

import java.util.List;
import org.springframework.security.access.annotation.Secured;
import tyovuoro.model.Place;

public interface PlaceDAO {

    public Place getPlace(int id);

    public Place getPlace(String name);

    public void editPlace(Place place);

    public void addPlace(Place place);

    public void deletePlace(int id);

    public List getAllPlaces();
}
