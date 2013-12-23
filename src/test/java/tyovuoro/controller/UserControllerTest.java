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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import com.github.springtestdbunit.DbUnitTestExecutionListener;
import com.github.springtestdbunit.annotation.DatabaseSetup;
import com.github.springtestdbunit.annotation.ExpectedDatabase;
import static org.hamcrest.Matchers.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
//import static org.springframework.test.web.server.samples.context.SecurityRequestPostProcessors.userDetailsService;

//@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
//@TestExecutionListeners({DependencyInjectionTestExecutionListener.class,
//    DirtiesContextTestExecutionListener.class,
//    TransactionalTestExecutionListener.class,
//    DbUnitTestExecutionListener.class})
//@ContextConfiguration(locations = {"classpath:application-context.xml"})
//@DatabaseSetup("classpath:db/userData.xml") //Mock-tietokantatiedosto
public class UserControllerTest {

//    @Resource
//    private FilterChainProxy springSecurityFilterChain;
//
//    @Resource
//    private WebApplicationContext webApplicationContext;
//
//    @Autowired
//    private StandardPasswordEncoder encoder;
//
//    private MockMvc mockMvc;

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
//        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
//                .addFilter(springSecurityFilterChain)
//                .build();
    }

    @After
    public void tearDown() {
    }

    @Test
//    @ExpectedDatabase("classpath:db/userData.xml")
    public void testShowUsers() throws Exception {
//        mockMvc.perform(get("/admin/user"))
//                .andDo(print())
//                .andExpect(status().isOk())
//                .andExpect(model().attribute("userList", hasSize(3)))
//                .andExpect(model().attribute("userList", hasItem(
//                                        allOf(
//                                                hasProperty("id", is(1)),
//                                                hasProperty("username", is("user1")),
//                                                hasProperty("address", is("address1"))
//                                        ))
//                        )
//                ).andExpect(model().attribute("userList", hasItem(
//                                        allOf(
//                                                hasProperty("id", is(2)),
//                                                hasProperty("username", is("user2")),
//                                                hasProperty("address", is("address2"))
//                                        )
//                                )
//                        ))
//                .andExpect(model().attribute("userList", hasItem(
//                                        allOf(
//                                                hasProperty("id", is(3)),
//                                                hasProperty("username", is("admin")),
//                                                hasProperty("address", is("address3"))
//                                        )
//                                )
//                        ));
    }

    @Test
//    @ExpectedDatabase("classpath:db/userDataUserAdded.xml")
    public void testAddUser() throws Exception {
//        String dataSetFile = "src/test/resources/db/userDataUserAdded.xml";
//        IDataSet dataSet = new FlatXmlDataSetBuilder().build(new File(dataSetFile));
//        ReplacementDataSet rDataSet = new ReplacementDataSet(dataSet);
////        Set<String> keys = dataSetAdjustments.keySet();
//        rDataSet.addReplacementObject("[passu]", encoder.encode("password4"));
//        ITable filteredTable = DefaultColumnFilter.includedColumnsTable(actual,expected.getTableMetaData().getColumns());
//        DefaultColumnFilter columnFilter = new DefaultColumnFilter();
//        columnFilter.excludeColumn("password");
//        FilteredTableMetaData metaData = new FilteredTableMetaData(dataSet.getTableMetaData(), columnFilter);
//        ITable filteredTable = DefaultColumnFilter.excludedColumnsTable(dataSet.getTable(dataSetFile), new String[]{"password"});
//        mockMvc.perform(post("/admin/user/create")
//                .param("username", "user4")
//                .param("password", "password4")
//                .param("firstname", "First4")
//                .param("lastname", "Last4")
//                .param("email", "first4@email.com")
//                .param("address", "address4")
//                .param("assigned_role", "3"));

//        mockMvc.perform(get("/admin/user"))
//                .andDo(print())
//                .andExpect(status().isOk())
//                .andExpect(model().attribute("userList", hasSize(4)))
//                .andExpect(model().attribute("userList", hasItem(
//                                        allOf(
//                                                hasProperty("id", is(4)),
//                                                hasProperty("username", is("user4")),
//                                                hasProperty("address", is("address4"))
//                                        ))
//                        )
//                );
    }
}
