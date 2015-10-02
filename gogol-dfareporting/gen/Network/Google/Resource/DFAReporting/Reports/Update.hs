{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.DFAReporting.Reports.Update
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Updates a report.
--
-- /See:/ <https://developers.google.com/doubleclick-advertisers/reporting/ DCM/DFA Reporting And Trafficking API Reference> for @DfareportingReportsUpdate@.
module Network.Google.Resource.DFAReporting.Reports.Update
    (
    -- * REST Resource
      ReportsUpdateResource

    -- * Creating a Request
    , reportsUpdate'
    , ReportsUpdate'

    -- * Request Lenses
    , ruQuotaUser
    , ruPrettyPrint
    , ruUserIP
    , ruReportId
    , ruProfileId
    , ruReport
    , ruKey
    , ruOAuthToken
    , ruFields
    ) where

import           Network.Google.DFAReporting.Types
import           Network.Google.Prelude

-- | A resource alias for @DfareportingReportsUpdate@ which the
-- 'ReportsUpdate'' request conforms to.
type ReportsUpdateResource =
     "userprofiles" :>
       Capture "profileId" Int64 :>
         "reports" :>
           Capture "reportId" Int64 :>
             QueryParam "quotaUser" Text :>
               QueryParam "prettyPrint" Bool :>
                 QueryParam "userIp" Text :>
                   QueryParam "key" Key :>
                     QueryParam "oauth_token" OAuthToken :>
                       QueryParam "fields" Text :>
                         QueryParam "alt" AltJSON :>
                           ReqBody '[JSON] Report :> Put '[JSON] Report

-- | Updates a report.
--
-- /See:/ 'reportsUpdate'' smart constructor.
data ReportsUpdate' = ReportsUpdate'
    { _ruQuotaUser   :: !(Maybe Text)
    , _ruPrettyPrint :: !Bool
    , _ruUserIP      :: !(Maybe Text)
    , _ruReportId    :: !Int64
    , _ruProfileId   :: !Int64
    , _ruReport      :: !Report
    , _ruKey         :: !(Maybe Key)
    , _ruOAuthToken  :: !(Maybe OAuthToken)
    , _ruFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ReportsUpdate'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ruQuotaUser'
--
-- * 'ruPrettyPrint'
--
-- * 'ruUserIP'
--
-- * 'ruReportId'
--
-- * 'ruProfileId'
--
-- * 'ruReport'
--
-- * 'ruKey'
--
-- * 'ruOAuthToken'
--
-- * 'ruFields'
reportsUpdate'
    :: Int64 -- ^ 'reportId'
    -> Int64 -- ^ 'profileId'
    -> Report -- ^ 'Report'
    -> ReportsUpdate'
reportsUpdate' pRuReportId_ pRuProfileId_ pRuReport_ =
    ReportsUpdate'
    { _ruQuotaUser = Nothing
    , _ruPrettyPrint = True
    , _ruUserIP = Nothing
    , _ruReportId = pRuReportId_
    , _ruProfileId = pRuProfileId_
    , _ruReport = pRuReport_
    , _ruKey = Nothing
    , _ruOAuthToken = Nothing
    , _ruFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
ruQuotaUser :: Lens' ReportsUpdate' (Maybe Text)
ruQuotaUser
  = lens _ruQuotaUser (\ s a -> s{_ruQuotaUser = a})

-- | Returns response with indentations and line breaks.
ruPrettyPrint :: Lens' ReportsUpdate' Bool
ruPrettyPrint
  = lens _ruPrettyPrint
      (\ s a -> s{_ruPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
ruUserIP :: Lens' ReportsUpdate' (Maybe Text)
ruUserIP = lens _ruUserIP (\ s a -> s{_ruUserIP = a})

-- | The ID of the report.
ruReportId :: Lens' ReportsUpdate' Int64
ruReportId
  = lens _ruReportId (\ s a -> s{_ruReportId = a})

-- | The DFA user profile ID.
ruProfileId :: Lens' ReportsUpdate' Int64
ruProfileId
  = lens _ruProfileId (\ s a -> s{_ruProfileId = a})

-- | Multipart request metadata.
ruReport :: Lens' ReportsUpdate' Report
ruReport = lens _ruReport (\ s a -> s{_ruReport = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
ruKey :: Lens' ReportsUpdate' (Maybe Key)
ruKey = lens _ruKey (\ s a -> s{_ruKey = a})

-- | OAuth 2.0 token for the current user.
ruOAuthToken :: Lens' ReportsUpdate' (Maybe OAuthToken)
ruOAuthToken
  = lens _ruOAuthToken (\ s a -> s{_ruOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
ruFields :: Lens' ReportsUpdate' (Maybe Text)
ruFields = lens _ruFields (\ s a -> s{_ruFields = a})

instance GoogleAuth ReportsUpdate' where
        authKey = ruKey . _Just
        authToken = ruOAuthToken . _Just

instance GoogleRequest ReportsUpdate' where
        type Rs ReportsUpdate' = Report
        request = requestWithRoute defReq dFAReportingURL
        requestWithRoute r u ReportsUpdate'{..}
          = go _ruQuotaUser (Just _ruPrettyPrint) _ruUserIP
              _ruReportId
              _ruProfileId
              _ruKey
              _ruOAuthToken
              _ruFields
              (Just AltJSON)
              _ruReport
          where go
                  = clientWithRoute
                      (Proxy :: Proxy ReportsUpdateResource)
                      r
                      u