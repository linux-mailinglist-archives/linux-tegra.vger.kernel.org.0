Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C19EF8231
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Nov 2019 22:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKKV1o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 16:27:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42648 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKKV1o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 16:27:44 -0500
Received: by mail-lj1-f196.google.com with SMTP id n5so15376659ljc.9
        for <linux-tegra@vger.kernel.org>; Mon, 11 Nov 2019 13:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyjzvAELG180plYQUJsk9bpjonlPk5sspSm2azOzUbU=;
        b=Jx2OLpHQJgZRH0sJ95mqIF3cmEZbiK8fBRVkG5ye5R3r7bj4KmZtdtRdn+xlTbfx8C
         2/JjQlkYHVAh8s9NGIQ3yvx4YW8HqmGvRAgnrE9yFvgeDRSIxy+6lW9QyW8muB6eu/JN
         6Dfstx6vvgY6rKl0rgeuGiQO9F3UOo7Bif3EzFJsaKA3Q7y83Mk89hXLYHJcBnDt9yd+
         OEuH/T/UiCstzfUuKKk9+lqXyJdSF/yiTO2UzcTrOCUpeKHhoCGys+B/Cm9DgiPs/GgB
         K1KrbrnbFZDhxMeJXNSFp0/rXHfNHygXEFj4jUMrcUDhCsO6pBdZuDLrS5QWOs2x0y0t
         HE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PyjzvAELG180plYQUJsk9bpjonlPk5sspSm2azOzUbU=;
        b=RXxYkY+wolw/JFLdv7BEcbd4w5GPf5bO13uTmLLNiRDW4VY60VS3PV96Oyeu2fjBgI
         gVRmaXvznFeliO08/dpgwJ1XTGi92PS6nIUVmk2TvDno4KwTofVRLu2Z7w2aNLvM+flE
         Nrit2cn3Xsta+miznrtIeIGYbXM4wsIY0iN/7AMzk1io25Vazy/mJFKDpL8hEetBf/t2
         w7dBk7I/VVGxCBldNB+fUBFLcrMk4rRijc7RVj3acyhdPh6lHI+Pvtc5PE3i8gKOyc+F
         mibuJdN+HBDO8PnzbXwukz2Un22Tsn7Nf0JCKCeDb5/QlQCNJjzxEV+2MHIh2/8m6hFy
         KjPg==
X-Gm-Message-State: APjAAAWbmjsEuXwiCCAnanGqJA540jQC2JbgRcbcro2Td1PQmsVAm1rz
        OVACw5kHAtoAxx6m6DMm9aU=
X-Google-Smtp-Source: APXvYqy6GHd3Xwsx5nQOIHtkusU7sETLoqJnz7URQi9sLY+cbYIPubU3cqFhyznF1GACKvxXYBJROQ==
X-Received: by 2002:a2e:9a08:: with SMTP id o8mr18356983lji.214.1573507662480;
        Mon, 11 Nov 2019 13:27:42 -0800 (PST)
Received: from localhost.localdomain (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.gmail.com with ESMTPSA id k25sm7344008ljg.22.2019.11.11.13.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 13:27:41 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/3] Minor cleanup of tegra-apbmisc.c
Date:   Tue, 12 Nov 2019 00:26:34 +0300
Message-Id: <20191111212637.22648-1-digetx@gmail.com>
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

Changelog:

v2: - Corrected commit's title of the "Warn if straps are not ready" patch.

Dmitry Osipenko (3):
  soc/tegra: fuse: Cache values of straps and Chip ID registers
  soc/tegra: fuse: Warn if straps are not ready
  soc/tegra: fuse: Correct straps' address for older Tegra124 device
    trees

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

-- 
2.23.0

