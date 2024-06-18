package com.accenture;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.anyString;

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

import com.accenture.DocumentLinkProvider;
import com.ptc.netmarkets.util.beans.NmCommandBean;
import wt.doc.WTDocument;
import wt.fc.ObjectReference;
import wt.preference.PreferenceClient;
import wt.preference.PreferenceHelper;
import wt.util.WTException;


@RunWith(PowerMockRunner.class)
@PrepareForTest({PreferenceHelper.class, NmCommandBean.class})
public class DocumentLinkProviderTest {

    @InjectMocks
    private DocumentLinkProvider documentLinkProvider;

    @Mock
    private NmCommandBean nmCommandBean;

    @Mock
    private WTDocument wtDocument;
    
    
    @Before
    public void setUp() throws WTException {
        when(nmCommandBean.getPrimaryOid().getRefObject()).thenReturn(wtDocument);
        PowerMockito.mockStatic(PreferenceHelper.class);
        when(PreferenceHelper.service.getValue(anyString(), eq(PreferenceClient.WINDCHILL_CLIENT_NAME))).thenReturn("https://google.com/");
        when(wtDocument.getNumber()).thenReturn("000000345");
    }

    @Test
    public void testGetLink() throws WTException {
        String result = documentLinkProvider.getLink(nmCommandBean);
        assertEquals("https://google.com/000000345", result);
    }

    @Test
    public void testGetPreferenceValue() throws WTException {
        String preferenceValue = documentLinkProvider.getPreferenceValue();
        assertEquals("https://google.com/", preferenceValue);
    }

    @Test
    public void testGetDocumentNo() {
        String documentNo = documentLinkProvider.getDocumentNo(wtDocument);
        assertEquals("000000345", documentNo);
    }
}
