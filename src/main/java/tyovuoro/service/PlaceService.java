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

    @Secured("isAuthenticated()")
    public Place getPlace(int id);

    @Secured("isAuthenticated()")
    public Place getPlace(String name);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void editPlace(Place place);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void addPlace(Place place);

    @Secured("hasRole('ROLE_MODERATOR')")
    public void deletePlace(int id);

    @Secured("isAuthenticated()")
    public List getAllPlaces();

    public Set getBannedUsers(String place);

    public List getValidUsers(String place);
}
