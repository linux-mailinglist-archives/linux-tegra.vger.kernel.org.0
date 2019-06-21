Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F424EB73
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfFUPCK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:02:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36337 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfFUPCK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:02:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so5715617wrs.3
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6dQv323Ey+4JIjdvTNU3vCXrozzKoZF5cqgk/Zii2Q=;
        b=oYMXiTi7gTsFbaVkl8bkK3VjNmg7W75D+0HSYCtoAyztnBevEe5ZWBUQG3WHE4TNYG
         ipVqnCwkcMCZyWysCr+/CEbO1N0yg8Ei/ZPxQTFuxGEl/gu5IS0Hov8Kd6Do3SpjNeua
         Q6lGBpIKXF6c4DDK2q9BZ1OgALbfNW/qxK5lfUUI3jfeMfOfsIbAPtp3obpEMugyP86V
         GfX58CtHxFd7r232R9GoXestxkX9RBpYDAfeRq5pYLTgdhutGRnKoLnQOX4APs4uLZml
         1oQBPdfr78yIR0VK3bwF9Cj3D/QqrKKonBYE2x5URiSGLslEWsYqd1pz+2LsHmSu4IFo
         qTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6dQv323Ey+4JIjdvTNU3vCXrozzKoZF5cqgk/Zii2Q=;
        b=EzfR31TIc87ph957XDKZKVk0s1SGC9kMmn/AeHwIPcFH8DXGEJ1tSa1YQjmPFlDy6P
         QiXRPqKLeOa59zqYuT/mAnPPJoZ6jKe+n9CcVrFWba4fm/Vddi0oFAS8NauUXdINFgFq
         wU57oBwQ/AJifbAwQt8dzDGJT31Rx6rMAD2mr4RhQ9vopKXopYpHmQ4+oUD/tqe9zpx3
         gqU9wH781ILiOhb4J77PPkE0amSo/mhp1omXOyhoTmqkfm7mooEbSoRT+pFUf+mwzRhP
         RrjOW3XJvh1Ud4inwtr0prIrVEs5nznb9HCpr2F6jXv4JkiCw9I44lgIp8R8T+NsAU+s
         A66w==
X-Gm-Message-State: APjAAAWodEF0AGEbG2zgg5mt0X7CUHcIunwGMwKfuo5XsC4a7kMEhVm3
        m7kDkg1Rg/2yn6PJ37ViJRA=
X-Google-Smtp-Source: APXvYqyywkuCCQ4TzzIszhPEqQRM4uPekw8uBNBNrr0JsRaa4vg+ysnSPdvzNSky7V2AqMVkXRxlyA==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr27908816wrt.59.1561129328516;
        Fri, 21 Jun 2019 08:02:08 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x129sm2241343wmg.44.2019.06.21.08.02.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:02:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] firmware: tegra: Changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:02:02 +0200
Message-Id: <20190621150206.19037-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-firmware

for you to fetch changes up to 61ed7ef952fc482ec8d4a966ed0d1e32df276c59:

  firmware: tegra: Early resume BPMP (2019-06-14 17:45:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.3-rc1

This contains a single, simple change that resumes the BPMP driver early
so that it is available when the various consumers want to enable their
clocks.

----------------------------------------------------------------
Bitan Biswas (1):
      firmware: tegra: Early resume BPMP

 drivers/firmware/tegra/bpmp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
