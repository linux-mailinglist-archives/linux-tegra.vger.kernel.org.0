Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1ACE1250F9
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 19:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLRSu1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 13:50:27 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32886 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfLRSu0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 13:50:26 -0500
Received: by mail-lj1-f193.google.com with SMTP id p8so3339691ljg.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8GFy2pED/8J+ZRiO4Ppzxdd7QEWXnBA1d94QCEK9XE=;
        b=us8+DFZVrBwH+M0VHwFgvSM6ySkTaQXdwfwhR4DwoQoWJEdM0O57AnLEupOcprFRLf
         1sC9L6mglzRNJrdSySo8OH52y7mjUq36sSyx3hKTsLOoHcxOubTO8M85l6TRyGsT8E9b
         QFCNt91i1ivinP3zTZicQGQeSw/YQW6rpJ6/brUGObiYjOByFUv/zOQeIUFTj7W5P21M
         1FaT1yptKPogtpK2/SLaw4QXciiVk63+IEDe3s30GvUc6Q1ULNDaF9pXzQqzwCkpMnb9
         ky6QKGGPzC4OtVL9j8Zz76oKatiklHWhYBRpUB+zmpFXrsKTJeFrRUe1Qn7w1szZXYq7
         Li0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8GFy2pED/8J+ZRiO4Ppzxdd7QEWXnBA1d94QCEK9XE=;
        b=RA3eW6xBQPFfhMTQ9l1W5ExILy0x9o4hzrkYGJJiHQdd7hcujxs/rQ1HdFHMJ7RWNa
         iz7Nu4nh4ca02DYPTdKxh4dLSYL62X+SpE4nzzTU1Ch6QnOMsYrDY/A01Io192aQRvTj
         VI5vHWeVfZkKqiHZs1Dxa3fWBwobz2WnDHPlRrqpMgWFvlMKAswqfsPenbU+Mw54YQBt
         BfrUtR/eu5K6KJVQoknACTTVWyp5adKnx7nkDGgzihJe5eQ0HmpEucJ6RVg73ewG8Bdh
         aauYUKxODFmxMgcX70UCxz4ZagFOE1OHctjFy6NuhbY18FwcfbD/YMv2wpbdFHwdvCwW
         UDBA==
X-Gm-Message-State: APjAAAWYsXm+w6v7MLqyJAe+PslPSRXpBa5FPx3jexIsNdKhUtXlW77K
        cTWGiISjR+wK0GHL1/ncils=
X-Google-Smtp-Source: APXvYqxzJSF5uD2z4owSFWjV2jE9Jy5E4EW0GGFsb3GA1Y1gSCFTr7cwpK9J8ttedZvbDFWEtSNUWQ==
X-Received: by 2002:a2e:980b:: with SMTP id a11mr2900798ljj.189.1576695024872;
        Wed, 18 Dec 2019 10:50:24 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id y7sm1592586ljn.31.2019.12.18.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 10:50:24 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] NVIDIA Tegra30 EMC driver improvements
Date:   Wed, 18 Dec 2019 21:49:59 +0300
Message-Id: <20191218185002.26970-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

I took a refreshed look at the driver's code and spotted few things that
could be improved. No critical fixes here, just improvements. Please
review and apply, thanks in advance!

Dmitry Osipenko (3):
  memory: tegra30-emc: Firm up suspend/resume sequence
  memory: tegra30-emc: Firm up hardware programming sequence
  memory: tegra30-emc: Correct error message for timed out auto
    calibration

 drivers/memory/tegra/tegra30-emc.c | 177 +++++++++++++++++------------
 1 file changed, 103 insertions(+), 74 deletions(-)

-- 
2.24.0

