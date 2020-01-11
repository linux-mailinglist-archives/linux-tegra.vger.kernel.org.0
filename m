Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A703137ACF
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbgAKAza (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:55:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34379 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgAKAza (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:55:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so3501656wrr.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MM/Yf3NVecuRSv0F4n7CfUV2baWCyZwpXRLFf3og0OY=;
        b=B2gbk1Gu8moLMZJ6A4tpGJaZpA1f+g7PnE2GYTl8BWG2u+bV+lKJDRAl18+NOFETWC
         rLzqMQmbNNJXArAXTsrym2XrgsNjD6NFIXr/B/YY5fv4EuiaHfsYqcsgXDa1//ssrXLU
         aCCnocz661VFfGf10DvEgB8uxTyJPW2gU1D5y85bsUYqfe0yxfsmuJ8ncqmzVr6XDxnP
         KtuKKKkVR5EwgPbQ8INFyxOI11/lVI+zueO9HWRjzq7VSjokGolcoyj8a/4zFgZs4k7+
         me4Bw2D7Pc7HhTXhRjz0W4RZQn4IQDAJ72L6C+nXQcWDa7gsL6eBoYZ0YA+vHv8dQE2D
         tblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MM/Yf3NVecuRSv0F4n7CfUV2baWCyZwpXRLFf3og0OY=;
        b=mQpz27k01aqHKQ42W7wGQG9wuQJFfehugP4dsEI+Ms+WbbZSodm4b4GQbFmzivlhXF
         1eWgdeVTbcUiQlNlS/iXrzkFaSDPbe4EzK9hGXjQhHS3n3bEN9tvpC5ZAwiUE8YwexTB
         trhtv1rZJ828biCv9k8OIk3Fd+kPP02LC2NdI1sAWN5/wXLq6USis9BDe1L59npPTLdi
         rsxIWXjVRObhr7XfnDY29QRXmZqMMN38zC5eBtNJi6xRzrG/YfL+d6wSxe1g2tBJFFQx
         NuxW4KPgeTwPkyB62BF0z/pQsUrzA3SMn2HUxrh7aNpM/yqtHF8Mc51s+R8E5OWz0sFo
         qhIw==
X-Gm-Message-State: APjAAAXWRQwFW4t0RuKT9k+864cylr/dRQf4GG4UOmXQ0AMhI9NgL77e
        RTBYz73KXab1ppEEZoojXfM=
X-Google-Smtp-Source: APXvYqzzx2qGeaHgnUv7FNOKQYgX+2m7m3CmddjG0TJqOQyk2fkrvbxi2eQQ5EfKXSpRdibKytrmow==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr6266194wru.150.1578704128361;
        Fri, 10 Jan 2020 16:55:28 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id x10sm4127803wrv.60.2020.01.10.16.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:55:27 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:55:26 +0100
Message-Id: <20200111005526.2413959-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-arm64-defconfig

for you to fetch changes up to ddb8840d2777bfca7c9ebc8c24ea20f9a37145ba:

  arm64: defconfig: Enable tegra XUDC support (2020-01-10 18:34:14 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.6-rc1

This enables the USB GPIO connector and Tegra XUDC drivers in the
default configuration.

----------------------------------------------------------------
Nagarjuna Kristam (1):
      arm64: defconfig: Enable tegra XUDC support

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
