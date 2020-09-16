Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2726CD75
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Sep 2020 22:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgIPU7i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Sep 2020 16:59:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgIPQag (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Sep 2020 12:30:36 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A92B223FB;
        Wed, 16 Sep 2020 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600269059;
        bh=xmzrdiPDzVhpJTnNuaWDllL6DAJjHryvlroLhWdhC9M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=1SOzr1ftqfk896/TZheIMp9Y5OQJlAqv5Rb7IRMk3qQ4uEy5eZv7YxkYhKOVDxGW0
         O65YkHDIgG1Ce8rxdSQVFNzalVXKEHTKP3Qp+pAUK3wXt90mp04qtSDGirtMMozHjl
         F1Q6QSQsnrecimNKmlLUAqskD0wF+V7uIujIH2Lo=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kIZ5F-00CMqs-JJ; Wed, 16 Sep 2020 16:10:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Sep 2020 16:10:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@linaro.org>, kernel-team@android.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linus.walleij@linaro.org
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard
 interrupts
In-Reply-To: <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
References: <20200901144324.1071694-1-maz@kernel.org>
 <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com>
 <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <3378cd07b92e87a24f1db75f708424ee@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sumit.garg@linaro.org, kernel-team@android.com, f.fainelli@gmail.com, linux@arm.linux.org.uk, jason@lakedaemon.net, saravanak@google.com, andrew@lunn.ch, catalin.marinas@arm.com, gregory.clement@bootlin.com, b.zolnierkie@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, tglx@linutronix.de, will@kernel.org, Valentin.Schneider@arm.com, linux-tegra@vger.kernel.org, linus.walleij@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jon,

+Linus, who is facing a similar issue.

On 2020-09-16 15:16, Jon Hunter wrote:
> Hi Marc,
> 
> On 14/09/2020 14:06, Marek Szyprowski wrote:
>> Hi Marc,
>> 
>> On 01.09.2020 16:43, Marc Zyngier wrote:
>>> Change the way we deal with GIC SGIs by turning them into proper
>>> IRQs, and calling into the arch code to register the interrupt range
>>> instead of a callback.
>>> 
>>> Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> This patch landed in linux next-20200914 as commit ac063232d4b0
>> ("irqchip/gic: Configure SGIs as standard interrupts"). Sadly it 
>> breaks
>> booting of all Samsung Exynos 4210/4412 based boards (dual/quad ARM
>> Cortex A9 based). Here are the last lines from the bootlog:
> 
> I am observing the same thing on several Tegra boards (both arm and
> arm64). Bisect is pointing to this commit. Reverting this alone does 
> not
> appear to be enough to fix the issue.

Right, I am just massively by the GICv3 spec, and failed to remember
that ye olde GIC exposes the source CPU in AIR *and* wants it back, 
while
newer GICs deal with that transparently.

Can you try the patch below and let me know?

         M.

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 98743afdaea6..56492bf8b6f9 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -121,9 +121,10 @@ static struct gic_chip_data 
gic_data[CONFIG_ARM_GIC_MAX_NR] __read_mostly;

  static struct gic_kvm_info gic_v2_kvm_info;

+static DEFINE_PER_CPU(u32, sgi_intid);
+
  #ifdef CONFIG_GIC_NON_BANKED
  static DEFINE_STATIC_KEY_FALSE(frankengic_key);
-static DEFINE_PER_CPU(u32, sgi_intid);

  static void enable_frankengic(void)
  {
@@ -135,16 +136,6 @@ static inline bool is_frankengic(void)
  	return static_branch_unlikely(&frankengic_key);
  }

-static inline void set_sgi_intid(u32 intid)
-{
-	this_cpu_write(sgi_intid, intid);
-}
-
-static inline u32 get_sgi_intid(void)
-{
-	return this_cpu_read(sgi_intid);
-}
-
  static inline void __iomem *__get_base(union gic_base *base)
  {
  	if (is_frankengic())
@@ -160,8 +151,6 @@ static inline void __iomem *__get_base(union 
gic_base *base)
  #define gic_data_cpu_base(d)	((d)->cpu_base.common_base)
  #define enable_frankengic()	do { } while(0)
  #define is_frankengic()		false
-#define set_sgi_intid(i)	do { } while(0)
-#define get_sgi_intid()		0
  #endif

  static inline void __iomem *gic_dist_base(struct irq_data *d)
@@ -236,8 +225,8 @@ static void gic_eoi_irq(struct irq_data *d)
  {
  	u32 hwirq = gic_irq(d);

-	if (is_frankengic() && hwirq < 16)
-		hwirq = get_sgi_intid();
+	if (hwirq < 16)
+		hwirq = this_cpu_read(sgi_intid);

  	writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_EOI);
  }
@@ -365,14 +354,13 @@ static void __exception_irq_entry 
gic_handle_irq(struct pt_regs *regs)
  			smp_rmb();

  			/*
-			 * Samsung's funky GIC encodes the source CPU in
-			 * GICC_IAR, leading to the deactivation to fail if
-			 * not written back as is to GICC_EOI.  Stash the
-			 * INTID away for gic_eoi_irq() to write back.
-			 * This only works because we don't nest SGIs...
+			 * The GIC encodes the source CPU in GICC_IAR,
+			 * leading to the deactivation to fail if not
+			 * written back as is to GICC_EOI.  Stash the INTID
+			 * away for gic_eoi_irq() to write back.  This only
+			 * works because we don't nest SGIs...
  			 */
-			if (is_frankengic())
-				set_sgi_intid(irqstat);
+			this_cpu_write(sgi_intid, intid);
  		}

  		handle_domain_irq(gic->domain, irqnr, regs);

-- 
Jazz is not dead. It just smells funny...
