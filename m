Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC2137AA7
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbgAKAgH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:07 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41711 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727752AbgAKAgH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id c9so3442249wrw.8
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JW4WaaZfWWvCV7Tj0/ukOg7JbJ65miboJGEuI4kt5RY=;
        b=rw0Zz8JRg7AADoywH5JdHf/TIC/2gKY1hw992tTll/t0HHnk0dgvyBBKGpJCGK9asp
         B6L4sQVkVkQIcjuXw8TtiMP1Q+jvbETw+P8yqw0b2u78au4O4KXZ7UU1e6E/McEUT4lW
         K2j/DikjoI/+6cAgpCsz5AhtxosV8yET8DEQfdqS8v7cQF6M4mx6V1iBncSyMEW+FVNF
         tg9W+nLBcMjzB4g9iNF86m44Jp0ZjW/NAbTKox0pq+mcE9SOjfRagqmfsgcOSTCVnUkK
         0r0Its9pJhpxjs+jhP2F926SrvRxd+1JcDQPa6zPK1e0FKyxQMsF0rR+ne0Ds5Cj1iqo
         bqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JW4WaaZfWWvCV7Tj0/ukOg7JbJ65miboJGEuI4kt5RY=;
        b=jEANiJdHnjRsRhmIwpYJMcE0ku+ZCTLpXSvzKbKxjx65MnO6LVgQJ4XpWnXU2tMd9G
         Z/4NQN5elqJJl5Ur9/4zF0v9hMFhcZR8ELDEVWWF3yS9GLL+QM4bcleMA4sqpT6GrQUK
         MJIHTN41rJuhizduS/Bs3n0avrsfZT+75fP6xu9n1RI3ilaKOiBPPe9QUdhlUB2Dy4LR
         PpWMk2Ue/yqV09BcQlgExR8sxg096tD4cZp7VcTT6vU4IPhu7kLVjJVbYSlndg/4Znhq
         p4gGokpA0gB3LYin/1EsRtb2zJTP6psEeNaL65Azs58MmX/9jlLQUjPDMngJWj2DmYGT
         eijg==
X-Gm-Message-State: APjAAAXGOvn2xZff6efHGnw3jl2HWl2q+Xuj0HE6ScOq6IkicQq9aeXk
        XMMA+tMHvb+zATccG/Z1JgDNTaVD
X-Google-Smtp-Source: APXvYqxEb3gf/zapkmtLoKYblJigB91qUjsp2RU5JH/yqoOiwUAAxgDbeqUsCz3DJ8dF2wiuULPgbw==
X-Received: by 2002:adf:c145:: with SMTP id w5mr5972862wre.205.1578702965119;
        Fri, 10 Jan 2020 16:36:05 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id r5sm4108321wrt.43.2020.01.10.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:50 +0100
Message-Id: <20200111003553.2411874-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm-core

for you to fetch changes up to 9c65b8463f41f3a9edef97e3109752159d4c6a4b:

  ARM: tegra: Use clk_m CPU on Tegra124 LP1 resume (2020-01-08 12:58:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.6-rc1

Contains a couple of fixes for RAM repair on Tegra124.

----------------------------------------------------------------
Stephen Warren (3):
      ARM: tegra: Enable PLLP bypass during Tegra124 LP1
      ARM: tegra: Modify reshift divider during LP1
      ARM: tegra: Use clk_m CPU on Tegra124 LP1 resume

 arch/arm/mach-tegra/sleep-tegra30.S | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)
