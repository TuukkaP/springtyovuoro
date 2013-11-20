package tyovuoro.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue
    private Integer id;
    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;
    @ManyToOne
    @JoinColumn(name = "place_id")
    private Place place;
    @ManyToOne
    @JoinColumn(name = "user_id")
    @NotFound(action = NotFoundAction.IGNORE)
    private User user;
    @Column
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    @DateTimeFormat(pattern = "dd.MM.yyyy")
    private LocalDateTime date;
    @Column
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    @DateTimeFormat(pattern = "HH:mm")
    private LocalDateTime order_start;
    @Column
    @Type(type = "org.jadira.usertype.dateandtime.joda.PersistentLocalDateTime")
    @DateTimeFormat(pattern = "HH:mm")
    private LocalDateTime order_end;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    @PrePersist
    protected void onCreate() {
        timestamp = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        timestamp = new Date();
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place place) {
        this.place = place;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public LocalDateTime getOrder_start() {
        return order_start;
    }

    public void setOrder_start(LocalDateTime order_start) {
        this.order_start = order_start;
    }

    public LocalDateTime getOrder_end() {
        return order_end;
    }

    public void setOrder_end(LocalDateTime order_end) {
        this.order_end = order_end;
    }

    @Override
    public String toString() {
        return place.getName() + " " + order_start.toString("HH:mm") + "-" + order_end.toString("HH:mm");
    }
}
