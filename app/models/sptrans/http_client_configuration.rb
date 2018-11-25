module Sptrans
  module HttpClientConfiguration
    private

    def base_url
      Sptrans.configuration.base_url
    end

    def auth_header
      # { 'access-token' => Sptrans.configuration.token }
      { 'set-cookie' => 'apiCredentials=EC738F8743C3B7AD55A5CB07A684FD2CD14F1ED48AD25F479C3761E4B169E0F08E761ED8C55993C4146D30AC850062D374D7158674C3932CE2387362A64F463EB9AF0F57B5B0ED1E2DD234A0884684E34AA43A4375EAAFE0D11DF3DC66538C012FEDACAC04F89C5A2A2750E60A0AD7A8107F064AE6DFBE62F7D6F435875606036805002E3CDA0524CBD655DC356BAC1E0357989C5B48D1FE0DA55E82B0BC34647E11AA4BE3AC1F98C7832F55327C63515C33142050480B23D7B74D04F65112B67F3DDA33'}
    end

    def basic_headers
      { 'User-Agent' => 'dencity',
        'Content-Type' => 'application/json',
        'Accept' => 'application/json' }.merge(auth_header)
    end
  end
end
