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
-- Module      : Network.Google.Resource.DFAReporting.CreativeFieldValues.Insert
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Inserts a new creative field value.
--
-- /See:/ <https://developers.google.com/doubleclick-advertisers/reporting/ DCM/DFA Reporting And Trafficking API Reference> for @DfareportingCreativeFieldValuesInsert@.
module Network.Google.Resource.DFAReporting.CreativeFieldValues.Insert
    (
    -- * REST Resource
      CreativeFieldValuesInsertResource

    -- * Creating a Request
    , creativeFieldValuesInsert'
    , CreativeFieldValuesInsert'

    -- * Request Lenses
    , cfviCreativeFieldId
    , cfviQuotaUser
    , cfviPrettyPrint
    , cfviCreativeFieldValue
    , cfviUserIP
    , cfviProfileId
    , cfviKey
    , cfviOAuthToken
    , cfviFields
    ) where

import           Network.Google.DFAReporting.Types
import           Network.Google.Prelude

-- | A resource alias for @DfareportingCreativeFieldValuesInsert@ which the
-- 'CreativeFieldValuesInsert'' request conforms to.
type CreativeFieldValuesInsertResource =
     "userprofiles" :>
       Capture "profileId" Int64 :>
         "creativeFields" :>
           Capture "creativeFieldId" Int64 :>
             "creativeFieldValues" :>
               QueryParam "quotaUser" Text :>
                 QueryParam "prettyPrint" Bool :>
                   QueryParam "userIp" Text :>
                     QueryParam "key" Key :>
                       QueryParam "oauth_token" OAuthToken :>
                         QueryParam "fields" Text :>
                           QueryParam "alt" AltJSON :>
                             ReqBody '[JSON] CreativeFieldValue :>
                               Post '[JSON] CreativeFieldValue

-- | Inserts a new creative field value.
--
-- /See:/ 'creativeFieldValuesInsert'' smart constructor.
data CreativeFieldValuesInsert' = CreativeFieldValuesInsert'
    { _cfviCreativeFieldId    :: !Int64
    , _cfviQuotaUser          :: !(Maybe Text)
    , _cfviPrettyPrint        :: !Bool
    , _cfviCreativeFieldValue :: !CreativeFieldValue
    , _cfviUserIP             :: !(Maybe Text)
    , _cfviProfileId          :: !Int64
    , _cfviKey                :: !(Maybe Key)
    , _cfviOAuthToken         :: !(Maybe OAuthToken)
    , _cfviFields             :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreativeFieldValuesInsert'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cfviCreativeFieldId'
--
-- * 'cfviQuotaUser'
--
-- * 'cfviPrettyPrint'
--
-- * 'cfviCreativeFieldValue'
--
-- * 'cfviUserIP'
--
-- * 'cfviProfileId'
--
-- * 'cfviKey'
--
-- * 'cfviOAuthToken'
--
-- * 'cfviFields'
creativeFieldValuesInsert'
    :: Int64 -- ^ 'creativeFieldId'
    -> CreativeFieldValue -- ^ 'CreativeFieldValue'
    -> Int64 -- ^ 'profileId'
    -> CreativeFieldValuesInsert'
creativeFieldValuesInsert' pCfviCreativeFieldId_ pCfviCreativeFieldValue_ pCfviProfileId_ =
    CreativeFieldValuesInsert'
    { _cfviCreativeFieldId = pCfviCreativeFieldId_
    , _cfviQuotaUser = Nothing
    , _cfviPrettyPrint = True
    , _cfviCreativeFieldValue = pCfviCreativeFieldValue_
    , _cfviUserIP = Nothing
    , _cfviProfileId = pCfviProfileId_
    , _cfviKey = Nothing
    , _cfviOAuthToken = Nothing
    , _cfviFields = Nothing
    }

-- | Creative field ID for this creative field value.
cfviCreativeFieldId :: Lens' CreativeFieldValuesInsert' Int64
cfviCreativeFieldId
  = lens _cfviCreativeFieldId
      (\ s a -> s{_cfviCreativeFieldId = a})

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
cfviQuotaUser :: Lens' CreativeFieldValuesInsert' (Maybe Text)
cfviQuotaUser
  = lens _cfviQuotaUser
      (\ s a -> s{_cfviQuotaUser = a})

-- | Returns response with indentations and line breaks.
cfviPrettyPrint :: Lens' CreativeFieldValuesInsert' Bool
cfviPrettyPrint
  = lens _cfviPrettyPrint
      (\ s a -> s{_cfviPrettyPrint = a})

-- | Multipart request metadata.
cfviCreativeFieldValue :: Lens' CreativeFieldValuesInsert' CreativeFieldValue
cfviCreativeFieldValue
  = lens _cfviCreativeFieldValue
      (\ s a -> s{_cfviCreativeFieldValue = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
cfviUserIP :: Lens' CreativeFieldValuesInsert' (Maybe Text)
cfviUserIP
  = lens _cfviUserIP (\ s a -> s{_cfviUserIP = a})

-- | User profile ID associated with this request.
cfviProfileId :: Lens' CreativeFieldValuesInsert' Int64
cfviProfileId
  = lens _cfviProfileId
      (\ s a -> s{_cfviProfileId = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
cfviKey :: Lens' CreativeFieldValuesInsert' (Maybe Key)
cfviKey = lens _cfviKey (\ s a -> s{_cfviKey = a})

-- | OAuth 2.0 token for the current user.
cfviOAuthToken :: Lens' CreativeFieldValuesInsert' (Maybe OAuthToken)
cfviOAuthToken
  = lens _cfviOAuthToken
      (\ s a -> s{_cfviOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
cfviFields :: Lens' CreativeFieldValuesInsert' (Maybe Text)
cfviFields
  = lens _cfviFields (\ s a -> s{_cfviFields = a})

instance GoogleAuth CreativeFieldValuesInsert' where
        authKey = cfviKey . _Just
        authToken = cfviOAuthToken . _Just

instance GoogleRequest CreativeFieldValuesInsert'
         where
        type Rs CreativeFieldValuesInsert' =
             CreativeFieldValue
        request = requestWithRoute defReq dFAReportingURL
        requestWithRoute r u CreativeFieldValuesInsert'{..}
          = go _cfviCreativeFieldId _cfviQuotaUser
              (Just _cfviPrettyPrint)
              _cfviUserIP
              _cfviProfileId
              _cfviKey
              _cfviOAuthToken
              _cfviFields
              (Just AltJSON)
              _cfviCreativeFieldValue
          where go
                  = clientWithRoute
                      (Proxy :: Proxy CreativeFieldValuesInsertResource)
                      r
                      u