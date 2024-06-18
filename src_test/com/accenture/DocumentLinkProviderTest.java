package com.accenture;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.anyString;

import java.lang.reflect.Field;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.powermock.api.support.membermodification.MemberMatcher;

import com.accenture.DocumentLinkProvider;
import com.ptc.netmarkets.util.beans.NmCommandBean;
import com.ptc.netmarkets.model.NmOid;
import wt.doc.WTDocument;
import wt.preference.PreferenceClient;
import wt.preference.PreferenceHelper;
import wt.preference.PreferenceService2;
import wt.util.WTException;


@RunWith(PowerMockRunner.class)
@PrepareForTest({PreferenceHelper.class, NmCommandBean.class})
public class DocumentLinkProviderTest {

	private static final String SERVICE_FIELD = "service";
	private static final String TEST_LINK_PREFERENCE_VALUE = "https://google.com/";
	private static final String TEST_DOCUMENT_NUMBER = "000000345";

    @Mock
    private NmCommandBean nmCommandBean;

    @Mock
    private NmOid nmOid;

    @Mock
    private WTDocument wtDocument;

    @Mock
	private PreferenceHelper preferenceHelper;

    @Mock
	private PreferenceService2 preferenceService;
    
    
    @Before
    public void setUp() throws Exception {

        PowerMockito.mockStatic(PreferenceHelper.class);
        Field field = MemberMatcher.field(PreferenceHelper.class, SERVICE_FIELD);
        field.set(preferenceHelper, preferenceService);
        when(nmCommandBean.getPrimaryOid()).thenReturn(nmOid);
        when(nmOid.getRefObject()).thenReturn(wtDocument);
        when(preferenceService.getValue(anyString(), anyString())).thenReturn(TEST_LINK_PREFERENCE_VALUE);
        when(wtDocument.getNumber()).thenReturn(TEST_DOCUMENT_NUMBER);
    }

    @Test
    public void testGetLink() throws Exception {
        String result = new DocumentLinkProvider().getLink(nmCommandBean);
        assertEquals(TEST_LINK_PREFERENCE_VALUE+TEST_DOCUMENT_NUMBER, result);
    }

    @Test
    public void testGetPreferenceValue() throws Exception {
        String preferenceValue = new DocumentLinkProvider().getPreferenceValue();
        assertEquals(TEST_LINK_PREFERENCE_VALUE, preferenceValue);
    }

    @Test
    public void testGetDocumentNo() throws Exception {
        String documentNo = new DocumentLinkProvider().getDocumentNo(wtDocument);
        assertEquals(TEST_DOCUMENT_NUMBER , documentNo);
    }
}
