Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F01ED36B
	for <lists+linux-tegra@lfdr.de>; Sun,  3 Nov 2019 14:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfKCNMw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 3 Nov 2019 08:12:52 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36719 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfKCNMw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Nov 2019 08:12:52 -0500
Received: by mail-lf1-f65.google.com with SMTP id a6so6865900lfo.3
        for <linux-tegra@vger.kernel.org>; Sun, 03 Nov 2019 05:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmaPvXRwTLKO95gAkWpsjW+0RUGjQhSCRI69IWwP0N0=;
        b=KPbQ6bzbGrwI3ZbT6+ji904yyz8ASyKgXabGxwhliZjq72RmGjos9Q0Mws6b1tnecE
         HXYf9DrhTEuojJZdb2RVQSovn+G1Sk/t0fMbJ8g9O/6jNym8HWTvXM0ehOMpWoP+wMO8
         IPnTDlYMpW+lhxZDdpDbMGbqF3V5W3ovJJydVxae1F1lj1xVDhJVjF0pubel6vH90PHk
         BRlvsYPM9L8Sa5DnIbdlkpYGo5KOnTKy34toR5q9Aku3NElvL5wBoJYBEgfaHTyDVWSr
         B9ntckEOo3zl2KQLQQ+ssd+Ad6zICuRELSPTXlgxYmeEwCQKmrheXCvfu0mfopThBlUZ
         UAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zmaPvXRwTLKO95gAkWpsjW+0RUGjQhSCRI69IWwP0N0=;
        b=lOZKtWMhBfkkEWamDfv0/Ps5FxbpD6FgYYg9VNvuapOkIXMrR46Mze44AANyA6SVcB
         YfmccGqlt+ok1W6z9g5E7pqkhhHALB7bOrv32+c+CoagdHvvaVRnBuwMuAvD0NHP+YrP
         WUe2HsSIs41hlrXRjOlys0E7HtEx9zRaaq9BTnIfs8/YKyzsHH9sZUofbBtUZMUhKOeg
         ivZDgDFmz6qRGXxWqkKKNVedi/tjeILJPXHP9eT78ykKTFAD/DWKxV/IrbjaWhpN+RAB
         EeKXvmXgYim18aj9yFT+cNYIcuqFADWpSeF+ZIQH33XivCoEeSQJnx/bdY6HRfSV3y4Z
         Tvjw==
X-Gm-Message-State: APjAAAXN2IHW0GayudU4VpN7CxktbhEch61elYx3q1QMGJPkagRPtBjl
        N7OBDswnWziUKx0DtNzGdVo=
X-Google-Smtp-Source: APXvYqwg3yENiL/K/5fhW9IftdBuDmlnq0VvnobX3MPRFzK72n6erXMvcgae6h5cs0Yp3/sCSJmiew==
X-Received: by 2002:ac2:434c:: with SMTP id o12mr13735678lfl.33.1572786768556;
        Sun, 03 Nov 2019 05:12:48 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id p8sm1700467ljn.0.2019.11.03.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 05:12:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] Minor cleanup of tegra-apbmisc.c
Date:   Sun,  3 Nov 2019 16:10:20 +0300
Message-Id: <20191103131023.17342-1-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

There are couple things could be improved in tegra-apbmisc.c and this
patchset addresses them. Please note that the fallback for older device
trees was broken for T124 since 2015, so it is also a minor change.

Dmitry Osipenko (3):
  soc/tegra: fuse: Cache values of straps and Chip ID registers
  soc/tegra: fuse: Warn if straps and not ready
  soc/tegra: fuse: Correct straps' address for older Tegra124 device
    trees

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

-- 
2.23.0

