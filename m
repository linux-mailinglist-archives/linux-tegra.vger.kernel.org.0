Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920D0309E58
	for <lists+linux-tegra@lfdr.de>; Sun, 31 Jan 2021 20:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhAaTqu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 31 Jan 2021 14:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbhAaTl0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 31 Jan 2021 14:41:26 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7895CC061354;
        Sun, 31 Jan 2021 09:33:10 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id s23so2652553pjz.4;
        Sun, 31 Jan 2021 09:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OCqlwfO8Y29nGZpydwpkYYTLuT/Y0WSarB/5hJMpIrI=;
        b=clsAZXvxgZ/QYBDXDbtJ4ra1untXoh43m/JKXpoj36mFm0NTF9xDZ4Fi6UUWdXVLU2
         Y2NyRER0oiHmVIINV0iIbfMP9jEN2oswqdjlsA1PdtxmpvHogl3KEFRiiDRXet3IjpbY
         VX3bdj8TnT2DO6FEoc42Z8aIfClVIJYWI7V2GHHaSuLUfbuysrEWnA0dSiQGnbyrMlyD
         vNHavG8UTyA6Td5n4FOSphSDHxBAKT5qDWSqn5jhKXAgY8hmM12i0jDOe3eZGqJB/NBF
         RVsZrpV19eW5wedv6j6jw+usPKIlLbfw2s9RmT+uUdu1qcbzBci4hKPzE6jSCgCGR32f
         +JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OCqlwfO8Y29nGZpydwpkYYTLuT/Y0WSarB/5hJMpIrI=;
        b=RWHFWUTSTU1tL78jJhoCUtI87LEshoIQzKoc84NbN6JrB5cNnUcF4zlkVAuH1+PZ3b
         EeWZbtdeRU7joIfFDK9X6innwxeaX/iAOcOvnfRbzYlSzMLf0qrdYdEZBF0dk7yCfN1Y
         Hl3x3xMSlt+u/Dkgc/xHgWjrE1cmgIm8OulHpoi0+elEG54ONuPA68AdEmWvJAgEZRxC
         Ut2WEi3kFdYqnM48JmGsKDJLYcs+FlfbIeEQ1Fm+rPiZyNGwfA6POd+aLzyItsf3mAz3
         ptRII1NhcKqhLersIVgrlCtdISWTIiVJh1FJtosIsoTDHRWlHUx2zGNwmC5J2yf8VrPi
         a4Eg==
X-Gm-Message-State: AOAM5301/zAedlFEgaD13lCaz9sEfo+ODp0rWpb+ZEZD2TW5LWiMYPXM
        k0P3kHgMGCeiwU2ZBX0ZpP4=
X-Google-Smtp-Source: ABdhPJxrcDtakyOOGA891Q1rZXY+m90HEiouugXutZuV7hNkCAUtDlwX09zIR5GawshucqOHMUegOw==
X-Received: by 2002:a17:90b:1955:: with SMTP id nk21mr8221442pjb.206.1612114390012;
        Sun, 31 Jan 2021 09:33:10 -0800 (PST)
Received: from localhost ([2402:3a80:11ea:e144:a2a4:c5ff:fe20:7222])
        by smtp.gmail.com with ESMTPSA id r5sm14566058pfl.165.2021.01.31.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 09:33:09 -0800 (PST)
From:   Kumar Kartikeya Dwivedi <memxor@gmail.com>
To:     devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org
Cc:     Kumar Kartikeya Dwivedi <memxor@gmail.com>,
        Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Ioana Radulescu <ruxandra.radulescu@nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Vaibhav Agarwal <vaibhav.sr@gmail.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Marc Dietrich <marvin24@gmx.de>,
        Jens Frederich <jfrederich@gmail.com>,
        Daniel Drake <dsd@laptop.org>,
        Jon Nettleton <jon.nettleton@gmail.com>,
        Larry Finger <Larry.Finger@lwfinger.net>,
        Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Robert Richter <rric@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        greybus-dev@lists.linaro.org, ac100@lists.launchpad.net,
        linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 12/13] staging: sm750fb: Switch from strlcpy to strscpy
Date:   Sun, 31 Jan 2021 22:58:33 +0530
Message-Id: <20210131172838.146706-13-memxor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131172838.146706-1-memxor@gmail.com>
References: <20210131172838.146706-1-memxor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

strlcpy is marked as deprecated in Documentation/process/deprecated.rst,
and there is no functional difference when the caller expects truncation
(when not checking the return value). strscpy is relatively better as it
also avoids scanning the whole source string.

This silences the related checkpatch warnings from:
5dbdb2d87c29 ("checkpatch: prefer strscpy to strlcpy")

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 029f0d09e..c237a8f8e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -814,7 +814,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strlcpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fixId[index], sizeof(fix->id));
 
 	fix->smem_start = crtc->oScreen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
-- 
2.29.2

