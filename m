Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F68919CC8
	for <lists+linux-tegra@lfdr.de>; Fri, 10 May 2019 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfEJLfv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 May 2019 07:35:51 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39561 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfEJLfv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 May 2019 07:35:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so7108044wmk.4
        for <linux-tegra@vger.kernel.org>; Fri, 10 May 2019 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WVtavxktsvcfzds2bAOB46VNLZJyLrZtioJAPLe0Ozs=;
        b=daSjT3yJtyeyqMaSesyKdsRBRJPSNauqi+f5P15u/9b5JsoCHVK4KaishNwNkK7DK9
         tLmB2QQeBqi+R3nY/8SyiqeQGcpRxcJNTfm5cnDUwiHPmAOisdH4gbjvkn9WX2YUYre+
         JBf9dPEGKXvX5WRVh+vOiZ3UIRyfPMwzQ0kyJcaqdbDtApN6Yel4j6MNsbdDU69c6boa
         +5TlXzwS9/ZvzjVtgOFIVyqwCmpHsS2Dns/bXzIb/T0JNAXjCeEGRXe69Sk7d5Lr3xKK
         c8CQ+Zvb4hMkAdViQsZDD2aIctxPJWBV8eSTDun+ggGAzFhXRk2riIhmfEn2Ds0Fo4cb
         Ndzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WVtavxktsvcfzds2bAOB46VNLZJyLrZtioJAPLe0Ozs=;
        b=HfbYN/wIiCn2SyXPoTNPGotZQJOw9e2AArYR2Zz4JSWjmz7PI5epyDL3vIXSWMVXfH
         9Ox+O5544uNJQZEroLTsdlbdnt/Cuktbrc3d6mWaocsYUcBNZFCehaDRIhclLiwlwtdG
         oX7MoLEDNYVwE5plB1W+nLTQqaRL3tqPRwO+1/B8USV5Ky0irgwLOTa9tNtIpkc3OdQ9
         /E7ZVFRu16MRt3x3eGH/w5JdVW6duAgyQ+E72F0rYRKBcDoo4LSzrBtZSf7P4O68VnDE
         9PQ1yg83Fj9+Anzx5C9vLCR/3N0xet8p0mRSpwbEwvWHaKTjVJZTfDrpWGdo7heDcK0r
         tuRg==
X-Gm-Message-State: APjAAAW6nEJVOgb66ch8ux6lhW4gfk7yTdHaWyjzqwWfdll36uwAYtLe
        lORqVCSAJGr9XLgeVUOFMa5kU6ZERsU=
X-Google-Smtp-Source: APXvYqxIl5YxwEiNv+9XsVPD1du4j0KAH4NCQGOy9NrM5U6GL42V8pHWj/PgZcmBaXjEIXmD4P20vg==
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr6988180wmc.1.1557488149088;
        Fri, 10 May 2019 04:35:49 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v17sm3239623wmc.30.2019.05.10.04.35.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 May 2019 04:35:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] bus/tegra: Fixes for v5.2-rc1
Date:   Fri, 10 May 2019 13:35:44 +0200
Message-Id: <20190510113546.15698-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 1427736e64c3a8b513cd984332f596055a7ca196:

  bus: tegra-aconnect: add system sleep callbacks (2019-03-28 17:26:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-bus-fixes

for you to fetch changes up to 6d6165603e162e3d391f35853a4ab232ab0db064:

  amba: tegra-ahb: Mark PM functions as __maybe_unused (2019-05-08 14:40:39 +0200)

Thanks,
Thierry

----------------------------------------------------------------
bus/tegra: Fixes for v5.2-rc1

This contains a single fix for a potential PM-related build issue.

----------------------------------------------------------------
Arnd Bergmann (1):
      amba: tegra-ahb: Mark PM functions as __maybe_unused

 drivers/amba/tegra-ahb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
