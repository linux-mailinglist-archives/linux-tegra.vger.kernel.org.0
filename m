Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09366C376
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jul 2019 01:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbfGQXJd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jul 2019 19:09:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38325 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbfGQXJc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jul 2019 19:09:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id f5so3057177pgu.5
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jul 2019 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ualberta-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYeZsMmbh9JZbTM3oKpX7itnTIQzoLzS/RJTcveqEpo=;
        b=vyYcyTVEWr2rsADr5n5Yu3lMTcnDLPqaJvddSU+c20s41qryCDL43C49yynXj2N+mA
         2SspEpQ6UiDOJhT0UvF7gJOtj9OuY0ofwnbA6GdhFV+sStX8+Fqn4ZjUAkdhPWoOEygf
         X6kmnGMSnBHv0J5Xg9A+9QjWmUUUwe/YoSX41VDXaU/kqAF9HxaDbEQrq9JG5ndEd/jg
         YF6jobuV7Cgux1DL/1z7u2VH5UZ/2xFVtVafySVC300tQQRy4rxWOXvTh+uQF/aXlpUK
         nuHF5lJRm7ljMisRxA7LAZ3UzXbcGBGD8hGxBz9UMxShUqve9pzHxW+IvCwJc4LSP7Hv
         Zfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYeZsMmbh9JZbTM3oKpX7itnTIQzoLzS/RJTcveqEpo=;
        b=qgRbJDFMuQgTwRuGustrpgealqz4lUqloIpPxVb+Ek0X51qNob3xUQDW86VUGcT1lz
         HcZ1XRYgvii5IYPAlonIGbbze87MDNNi4+Le0I1g/EoHTMWF51TNC0C1quS+GlE/ECV9
         2ElYW/WBo2ftyNiofxWU6pt+djg8ZWbs+ITQvqssIpIDJePORr/RrpkyOfYevbaH5/qC
         otPnKz5wVeggbyGC1glhGBXESBSZjK0EBp4C0FfJJ9e+rp+nCrqx4tjEL4mN5SwLBM+4
         omF/QJ0fiGf34x7lg38GQt6ibetmGAW8CWndjQRT004Vb8IBDOj2PZysIsdhANcrPuP7
         3MnA==
X-Gm-Message-State: APjAAAVeozQnV4ZMO+WFc9nHbWCMz7jEyKHRTSUjd8ivdGwozKVRFP1R
        O4hb6XwKxfZzuZn+3Y0VBenrLmF8TGI=
X-Google-Smtp-Source: APXvYqzixKEL2SFwhc8HfOlyR3YDRcNRCirf+hknZdhTHRfTXRn/Hnxv7Ni5bmV0NmnDy/R+s6hqtg==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr42974143pgv.243.1563404971450;
        Wed, 17 Jul 2019 16:09:31 -0700 (PDT)
Received: from localhost ([167.99.100.103])
        by smtp.gmail.com with ESMTPSA id p1sm27747835pff.74.2019.07.17.16.09.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 16:09:30 -0700 (PDT)
From:   Jacob Garber <jgarber1@ualberta.ca>
To:     linux-tegra@vger.kernel.org
Cc:     Jacob Garber <jgarber1@ualberta.ca>
Subject: [cbootimage PATCH] Free image buffer on read error
Date:   Wed, 17 Jul 2019 17:07:48 -0600
Message-Id: <20190717230748.23204-1-jgarber1@ualberta.ca>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Free the buffer after a read error to prevent a memory leak. This was
flagged by a Coverity scan of the coreboot project, which uses
cbootimage.

Signed-off-by: Jacob Garber <jgarber1@ualberta.ca>
---
 src/set.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/set.c b/src/set.c
index 934a58d..2013169 100644
--- a/src/set.c
+++ b/src/set.c
@@ -98,6 +98,7 @@ read_from_image(char	*filename,
 	if (fread(*image, 1, (size_t)(*actual_size), fp) !=
 		(size_t)(*actual_size)) {
 		result = 1;
+		free(*image);
 		goto cleanup;
 	}
 
-- 
2.22.0

