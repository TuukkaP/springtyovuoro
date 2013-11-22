/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tyovuoro.service;

import java.util.List;
import java.util.Set;
import org.springframework.security.access.annotation.Secured;
import tyovuoro.model.Place;

public interface PlaceService {

    public Place getPlace(int id);

    public Place getPlace(String name);

    public void editPlace(Place place);

    public void addPlace(Place place);

    public void deletePlace(int id);

    public List getAllPlaces();

    public Set getBannedUsers(String place);

    public List getValidUsers(String place);
}
