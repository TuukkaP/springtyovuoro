package tyovuoro.controller;

import javax.annotation.Resource;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import static org.hamcrest.Matchers.*;
// import static org.springframework.test.web.server.samples.context.SecurityRequestPostProcessors.userDetailsService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@TestExecutionListeners({DependencyInjectionTestExecutionListener.class,
    DirtiesContextTestExecutionListener.class,
    TransactionalTestExecutionListener.class,
    DbUnitTestExecutionListener.class})
@ContextConfiguration(locations = {"classpath:application-context.xml"})
@DatabaseSetup("classpath:userData.xml") //Mock-tietokantatiedosto
public class UserControllerTest {

    @Resource
    private FilterChainProxy springSecurityFilterChain;

    @Resource
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    public UserControllerTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
                .addFilter(springSecurityFilterChain)
                .build();
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of showUsers method, of class UserController.
     */
//        @Test
//    @ExpectedDatabase("toDoData.xml")
//    public void findAll() throws Exception {
//        mockMvc.perform(get("/api/todo"))
//                .andExpect(status().isOk())
//                .andExpect(content().mimeType(IntegrationTestUtil.APPLICATION_JSON_UTF8))
//                .andExpect(content().string("[{\"id\":1,\"description\":\"Lorem ipsum\",\"title\":\"Foo\"},{\"id\":2,\"description\":\"Lorem ipsum\",\"title\":\"Bar\"}]"));
//    }
    
    @Test
    @ExpectedDatabase("classpath:userData.xml")
    public void testShowUsers() throws Exception {
//        mockMvc.perform(get("/user/user1")).with(userDetailsService("user"))
//                        .andExpect(status().isOk());
    }

}
